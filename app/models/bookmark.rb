class Bookmark < ActiveRecord::Base

  attr_accessible :url, :title, :user, :category
  
end
