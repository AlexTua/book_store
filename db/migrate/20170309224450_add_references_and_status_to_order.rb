class AddReferencesAndStatusToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :status, :string
    add_column :orders, :credit_card_id, :integer, index: true
    add_column :orders, :user_id, :integer, index: true
  end
end
