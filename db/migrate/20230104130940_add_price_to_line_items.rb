class AddPriceToLineItems < ActiveRecord::Migration[6.1]
  # def change
  #   add_column :line_items, :price, :integer
  # end

  def up
    add_column :line_items, :price, :decimal

    LineItem.all.each do |lineItem|
      lineItem.price = lineItem.product.price
      lineItem.save!
    end
  end

  def down
    remove_column :line_items, :price
  end
end
