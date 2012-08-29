class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  attr_accessible :url, :title, :category, :user
  
  scope :by_category, lambda { |category| where("bookmarks.category = ?", category ) }
  
end
