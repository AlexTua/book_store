class CreateJoinTableAuthorBook < ActiveRecord::Migration[5.0]
  def change
    create_join_table :books, :authors do |t|
      t.index [:book_id, :author_id], unique: true
    end
  end
end