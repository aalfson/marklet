require 'test_helper'

class BookmarkControllerTest < ActionController::TestCase

  test "should create bookmark" do
    assert Bookmark.count == 0
    post :post, url: "www.tripphix.com", title: "TripPhix", id: '1' 
    assert Bookmark.count == 1
  end

end
