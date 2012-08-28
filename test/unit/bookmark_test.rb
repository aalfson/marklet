require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  
  test "should create bookmark do" do
    
    url = "http://www.google.com"
    title = "Google"
    user = User.first
    
    b = Bookmark.create(url: url, title: title, user: user)
    
    assert b.save
    assert b.url == url
    assert b.title == title
    assert b.user == user

  end
  
  test "should update bookmark do" do
    
    url = "http://www.google.com"
    title = "Google"
    user = User.first
    
    b = Bookmark.create(url: url, title: title, user: user)
    
    url = "http://stackoverflow.com/"
    title = "Stack Overflow"
    
    b.url = url
    b.title = title
    b.save
        
    assert b.valid?
    assert b.url == url
    assert b.title == title 
    
  end
  
  test "should destroy bookmark do" do
    
      url = "http://www.google.com"
      title = "Google"
      user = User.first

      b = Bookmark.create(url: url, title: title, user: user)
      assert b.persisted?
    
      assert b.valid?
      b.delete
      assert b.persisted? == false
      
  end
  
end
