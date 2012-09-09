class CategoryController < ApplicationController
  
  before_filter :authenticate_user!, :except => :index
  
  #controller for new category form page
  def new
  end
  
  #creates a new category
  def create
     
     name = params[:name]
     description = params[:description]
    
     #checks to see if the name is not blank, or that it does not already exist. 
     #If those conditions are satisfied, creates the Category. 
     if (name == "" || name == nil)
       redirect_to :back, :flash => {error: "You must give your category a name."}
     elsif Category.where(name: name).empty? == false
       redirect_to '/c/' + name, :flash => {error: "The category you tried to create already exists."}
     else
       #standardizes the name of the category
       name.capitalize!
      
       c = Category.create(name: name, description: description)
       c.add_moderator(current_user)
       c.save
       redirect_to '/c/' + name , :flash => {success: "You successfully created a new category!"}
     end
     
  end
  
  #controller for edit category form page
  def edit
    
    category = get_category(params[:category])
    
    #check that the current user is a moderator for the page and set @category
    if category.moderator?(current_user)
      @category = category
    else
      redirect_to :root, :flash => {error: "You must be a moderator to edit this category!"}
    end
  end
  
  #updates category
  def update
        
    category = get_category(params[:original_name])
    
    #check that the current user is a moderator for the page
    if category.moderator?(current_user)
      category.update_attributes(name: params[:name], description: params[:description])
      redirect_to '/c/' + category.name, :flash => {success: "You successfully updated " + category.name}
    else
      redirect_to :root, :flash => {error: "You must be a moderator to edit this category!"}
    end
  end
  
  def index
    @Categories = Category.all
  end
  
  def subscribe
    
    status = nil
    message = nil
    
    begin
      category = Category.where(name: params[:category]).limit(1)[0]
      
      if (category.subscriber?(current_user) == false)
        s = Subscriber.create(category: category, user: current_user, moderator: false)
        status = 304
        message = "You successfully subscribed to this category"
      end
      
    rescue
      status = 500
      message = "Could not process your request."
    end
    
    respond_to do |format|
      response.status = status
      format.json {render :json => message }
    end
  end
  
  def unsubscribe
    
    status = nil
    message = nil
    
    begin
      category = Category.where(name: params[:category]).limit(1)[0]
      
      debug(category.subscriber?(current_user))
      
      if(category.subscriber?(current_user))
        s = Subscriber.where(category_id: category.id, user_id: current_user.id)
        Subscriber.delete(s)
        status = 304
        message = "You have sucessfully unsubscribed from this category."
      end
      
    rescue
      status = 500
      message = "Could not process your request."
    end
    
    respond_to do |format|
      response.status = status
      format.json {render :json => message }
    end      
  end
  
  private 
  
  #helper method that ensures a valid category is provided to the controller
  def get_category(category_name)
  
    category = Category.where(name: category_name).limit(1)
    
    #check that category exists
    if category == nil || category.empty?
      nil
    else
      return category[0]
    end
  end

  def debug(message)
    puts "**************************************"
    puts message
    puts "**************************************"
  end
  
end
