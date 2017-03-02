class RemoveDimensionFromBook < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :dimension, :text
  end
end
