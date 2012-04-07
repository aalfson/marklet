class AddUserToBookmark < ActiveRecord::Migration
  def change
    add_column :bookmarks, :user, :string
  end
end
