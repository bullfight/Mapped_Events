class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  def index
    @title = "Events"
    @posts = Post.search(params[:search])#, :order => :date_of)
    
    respond_to do |format|
      format.html
      format.json { render :partial => "posts/index.json" }
    end
  end
  
  def show
    @title = "Event - "
    respond_to do |format|
      format.html
      format.json { render :partial => "posts/show.json" }
    end
  end

  def new
    @title = "New Event"
  end

  def create
    @post.user = current_user

    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @title = "Edit - "
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post.destroy
    redirect_to @post, :notice => "Successfully destroyed post."
  end
end
