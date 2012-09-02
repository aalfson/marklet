class Category < ActiveRecord::Base
  has_many :bookmarks
  has_and_belongs_to_many :users
  
  # attr_accessible :title, :body
  attr_accessible :name, :id, :bookmarks
  
  def users_count
    users.count
  end
end
