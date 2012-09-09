class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_var
  
  private
  def set_var
    @categories = Category.limit(20)
    
    if user_signed_in? 
      @user_categories = current_user.categories
    end
  end
  
end
