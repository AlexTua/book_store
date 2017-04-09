class AddDimensionsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :dimensions, :json, default: {'H': 0, 'W': 0, 'D': 0}
  end
end
