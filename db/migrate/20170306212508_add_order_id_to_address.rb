class AddOrderIdToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :order_id, :integer, index: true
  end
end
