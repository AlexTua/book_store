class RemovePicturesFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :pictures, :json
  end
end
