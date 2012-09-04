class Subscriber < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  attr_accessible :category, :moderator, :user
end
