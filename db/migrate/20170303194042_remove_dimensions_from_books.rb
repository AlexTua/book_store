class RemoveDimensionsFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :dimensions, :text
  end
end
