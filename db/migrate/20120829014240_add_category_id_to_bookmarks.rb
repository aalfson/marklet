class AddCategoryIdToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :category_id, :integer
  end
end
