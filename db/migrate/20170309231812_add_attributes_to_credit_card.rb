class AddAttributesToCreditCard < ActiveRecord::Migration[5.0]
  def change
    add_column :credit_cards, :card_number, :string
    add_column :credit_cards, :name_on_card, :string
    add_column :credit_cards, :mm_yy, :string
    add_column :credit_cards, :cvv, :string
  end
end
