class CategoryController < ApplicationController
  
  before_filter :authenticate_user!
  
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
       redirect_to :back, error: "You must give your category a name."
     elsif Category.where(name: name).empty? == false
       redirect_to '/c/' + name, error: "The category you tried to create already exists."
     else
       #standardizes the name of the category
       name.capitalize!
          
       c = Category.create(name: name, description: description, users: [current_user])
       c.add_moderator(current_user)
       c.save
       redirect_to '/c/' + name , success: "You successfully created a new category!"
     end
     
  end
  
  #controller for edit category form page
  def edit
    
    category = validate_category(params)
    
    #check that the current user is a moderator for the page and set @category
    if category.moderator?(current_user)
      @category = category
    else
      redirect_to :back, error: "You must be a moderator to edit a category!"
    end
  end
  
  #updates category
  def update
    
    category = validate_category(params)
    
    #check that the current user is a moderator for the page
    if category.moderator?(current_user)
      category.update_attributes(name: params[:name], description: params[:description])
    else
      redirect_to :back, error: "You must be a moderator to edit a category!"
    end
  end
  
  
  def index
  
  end
  
  def subscribe
    
  end
  
  private 
  
  #helper method that ensures a valid category is provided to the controller
  def validate_category(params)
  
    category = Category.where(name: params[:category]).limit(1)
    
    #check that category exists
    if category == nil || category.empty?
      redirect_to :root, error: "That category does not exist."
    else
      category = category[0]
      return category
    end
  end
  
end
