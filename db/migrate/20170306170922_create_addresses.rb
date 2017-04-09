class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :city
      t.integer :zip
      t.string  :phone
      t.string  :address_name

      t.timestamps
    end
  end
end
