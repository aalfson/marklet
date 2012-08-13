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
  
end
