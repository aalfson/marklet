class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.integer :category_id
      t.integer :user_id
      t.boolean :moderator
      t.timestamps
    end
  end
end
