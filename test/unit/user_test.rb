require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "should create user do" do
    
    name = "Peter Griffin"
    password = "nimda"
    email = "peter@test.com"
    
    u = User.create(name: name, password: password, email: email)
    
    assert u.save
    assert u.name == name
    assert u.email == email
    
  end
  
  test "should throw name-required validation error" do

    name = "Peter Griffin"
    password = "nimda"
    email = "peter@test.com"
    
    u = User.new(password: password, email: email)
    
    #check for errors on name
    assert !u.valid?
    assert u.errors[:name].any?
    assert_equal ["can't be blank"], u.errors[:name]
    
    #add name
    u.name = name
    
    # errors should be gone
    assert u.valid? 
  end
  
end
