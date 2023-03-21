# frozen_string_literal: true

class Product < ApplicationRecord
  include ActiveModel::Serializers::Xml
  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, { presence: true }
  validates :title, uniqueness: true
  validates :title, allow_blank: true, length: { minimum: 10, message: 'is too short! Minimum 10 chars.' }
  validates :image_url, allow_blank: true, format: {
    with: /\.(gif|jpg|png)\z/i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :price, { numericality: { greater_than_or_equal_to: 0.01 } }

  private

  def ensure_not_referenced_by_any_line_item
    return if line_items.empty?

    errors.add(:base, 'Line items present.')
    throw :abort
  end
end
