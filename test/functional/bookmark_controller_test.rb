require 'test_helper'
include Devise::TestHelpers

class BookmarkControllerTest < ActionController::TestCase

  test "should get index" do
    
    #devise login helper method
    user = User.find('1')
    sign_in user
    
    get :index
    assert_response :success
    assert_template :index
  end

  test "should route to create bookmark" do
    assert_routing '/bookmark/create', { :controller => "bookmark", :action => "create"}
  end

  test "should create bookmark" do
    assert Bookmark.count == 0
    post :create, url: "www.google.com", title: "Google", id: '1', category: '1', method: 'post'
    assert Bookmark.count == 1
    
    b = Bookmark.first
    
    assert b.url == "www.google.com"
    assert b.title == "Google"
    assert b.user.id == 1, "bookmark creation failed with user id: " + b.user.id.to_s
    assert b.category.id == 1, "bookmark creation failed with category id: " + b.category.id.to_s
  end

  test "should route to update bookmark" do
    assert_routing '/bookmark/update', { :controller => "bookmark", :action => "update"}
  end

  test "should update bookmark" do
    
    #devise login helper method
    user = User.find('1')
    sign_in user
    
    assert Bookmark.count == 0
    post :create, url: "www.universetoday.com", title: "Universe Today", id: '1', category: '3' 
    assert Bookmark.count == 1, "Bookmark count = " + Bookmark.count.to_s
    
    b = Bookmark.first
    
    assert b.url == "www.universetoday.com"
    assert b.title == "Universe Today"
    
    post :update, url: "http://news.ycombinator.com/", title: "Hacker News", id: b.id, category: '3'
    
    b = Bookmark.first
    
    assert b.url == "http://news.ycombinator.com/", "Url incorrect: " + b.url
    assert b.title == "Hacker News"
    assert b.category.name == "Astronomy"
  end
  
  test "should route to delete bookmark" do
    assert_routing '/bookmark/delete', { :controller => "bookmark", :action => "delete"}
  end
  
  test "should delete bookmark" do
    
    #devise login helper method
    user = User.find('1')
    sign_in user
    
    assert Bookmark.count == 0
    post :create, url: "www.universetoday.com", title: "Universe Today", id: '1' 
    assert Bookmark.count == 1, "Bookmark count = " + Bookmark.count.to_s
    
    b = Bookmark.first
    
    assert b.url == "www.universetoday.com"
    assert b.title == "Universe Today"
    
    delete :delete, { id: b.id }
    
    assert Bookmark.count == 0, "Bookmark.count is not 0, found instead: " + Bookmark.count.to_s
  end

end
