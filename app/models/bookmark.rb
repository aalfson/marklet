class Bookmark < ActiveRecord::Base
  belongs_to :user

  attr_accessible :url, :title, :category
end
