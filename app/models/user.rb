class User < ActiveRecord::Base
  attr_accessible :id, :name, :email
end
