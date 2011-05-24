class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    #@category = Category.find(params[:id])
  end

  def new
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
