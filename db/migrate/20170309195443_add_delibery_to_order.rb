class AddDeliberyToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_id, :integer
    rename_column :orders, :subtotal, :total_price
  end
end
