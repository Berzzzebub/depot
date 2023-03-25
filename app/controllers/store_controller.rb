class StoreController < ApplicationController
  include StoreIndexCounter
  include CurrentCart
  before_action :set_cart
  before_action :session_count
  def index
    @products = Product.order(:title)
    @page_title = 'My Store'
  end
end
