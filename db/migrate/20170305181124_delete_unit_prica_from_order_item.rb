class DeleteUnitPricaFromOrderItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_items, :unit_price, :decimal, precision: 10, scale: 2
  end
end
