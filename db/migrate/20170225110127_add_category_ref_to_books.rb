class AddCategoryRefToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :category, index: true, foreign_key: true
  end
end
