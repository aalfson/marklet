class Category < ActiveRecord::Base
  has_many :bookmarks
  
  # attr_accessible :title, :body
  attr_accessible :name, :id, :bookmarks
end
