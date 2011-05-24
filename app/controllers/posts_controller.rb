class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    @title = "Events"
    @posts = Post.find(:all, :order => :date_of)
    @post = Post.new
  end
  
  def show
    @title = "Event - "
    #@post = Post.find(params[:id])
  end

  def new
    @title = "New Event"
    #@post = Post.new
  end

  def create
    #@post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @title = "Edit - "
    #@post = Post.find(params[:id])
  end

  def update
    #@post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    #@post = Post.find(params[:id])
    @post.destroy
    redirect_to @post, :notice => "Successfully destroyed post."
  end
end
