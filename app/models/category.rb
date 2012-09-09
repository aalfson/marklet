class Category < ActiveRecord::Base
  has_many :bookmarks
  has_many :subscribers
  has_many :users, :through => :subscribers do
    def moderators
      where("subscribers.moderator = ?", true)
    end
  end
    
  attr_accessible :name, :id, :bookmarks, :description, :users
  
  def users_count
    self.users.count
  end
  
  #Adds a user as a moderator. Creates a subscription to the category if one does not already exist. 
  def add_moderator(user)
      
      if self.users.moderators == nil || subscriber?(user) == false
        # puts "********************"
        # puts user
        # puts "******"
        # puts self.users.moderators
        # puts subscriber?(user) == false
        # puts "********************"
        Subscriber.create(category: self, user: user, moderator: true)
      else
        s = Subscriber.where(:category_id => self.id, :user_id => user.id).limit(1)[0]
        s.moderator = true
        s.save
      end
  end
  
  #removes the moderator from the category. Does not remove their subscription. 
  def remove_moderator(user)
    
    if self.users.moderators != nil && self.users.moderators.include?(user)
    
      #basic validation to ensure that the category has at least 1 moderator
      if (self.users.moderators.count > 0 == false)
        return redirect_to :back, notice: "Category must have at least 1 moderator."
      else
        #remove the moderator
        s = Subscriber.where(:category_id => self.id, :user_id => user.id).limit(1)[0]
        s.moderator = false
        s.save
      end  
    else
      nil
    end  
  end
  
  def moderators
    self.users.moderators
  end

  def moderator?(user)
    return self.users.moderators.include?(user)
  end
  
  def subscriber?(user)
    return self.users.include?(user)
  end
end
