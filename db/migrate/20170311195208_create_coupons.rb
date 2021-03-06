class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string  :code
      t.decimal :discount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
