class AddBookmarkToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :bookmark, foreign_key: true
  end
end
