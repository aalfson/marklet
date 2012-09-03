class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :bookmarks
  has_and_belongs_to_many :categories
  
  validates_presence_of :name
  validates_uniqueness_of :name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id, :name, :bookmarks, :categories
end
