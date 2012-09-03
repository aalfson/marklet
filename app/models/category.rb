class Category < ActiveRecord::Base
  has_many :bookmarks
  has_and_belongs_to_many :users
  
  serialize :moderators
  
  attr_accessible :name, :id, :bookmarks, :description, :users
  
  def users_count
    self.users.count
  end
  
  def add_moderator(user)
    
    if self.moderators == nil
      self.moderators = Array.new [user.id]
    end
    
    if self.moderators.include?(user.id) == false
      self.moderators.push(user.id)
    end
    
    self.save
  end
  
  def remove_moderator(user)
  
    if self.moderators != nil && self.moderators.include?(user.id)
      self.moderators.delete(user.id)
    else
      nil
    end  
    
    self.save    
  end
  
  def moderator?(user)
    if self.moderators.include?(user.id)
      return true
    else
      return false
    end
  end
  
end
