class AddCountryToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :country, :string
    add_column :addresses, :address_type, :string
  end
end
