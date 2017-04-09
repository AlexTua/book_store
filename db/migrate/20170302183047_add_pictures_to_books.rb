class AddPicturesToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :pictures, :json
  end
end
