class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    @title = "Categories"
    @categories = Category.all
  end

  def show
    @title = "Event - "
    #@category = Category.find(params[:id])
  end

  def new
    @title = "New Category"
    #@category = Category.new
  end

  def create
    #@category = Category.new(params[:category])
    @category.user = current_user
    if @category.save
      redirect_to @category, :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @title = "Edit - "
    #@category = Category.find(params[:id])
  end

  def update
    #@category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @category, :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    #@category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, :notice => "Successfully destroyed category."
  end
end
