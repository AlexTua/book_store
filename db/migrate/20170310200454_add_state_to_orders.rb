class AddStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string
    add_column :orders, :coupon, :integer, default: 0
  end
end
