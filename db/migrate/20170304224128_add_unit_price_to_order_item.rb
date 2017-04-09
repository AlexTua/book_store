class AddUnitPriceToOrderItem < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :unit_price, :decimal, precision: 10, scale: 2
  end
end
