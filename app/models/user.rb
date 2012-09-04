class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :bookmarks
  has_many :subscribers
  has_many :categories, :through => :subscribers
  
  validates_presence_of :name
  validates_uniqueness_of :name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id, :name, :bookmarks, :categories, :subscribers
end
