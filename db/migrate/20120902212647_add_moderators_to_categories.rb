class AddModeratorsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :moderators, :string
  end
end
