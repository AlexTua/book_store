class AddYearAndMaterialsToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :year, :integer
    add_column :books, :materials, :text
  end
end
