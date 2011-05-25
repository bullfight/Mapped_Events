class VenuesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  def index
    @venues = Venue.all
  end

  def show
  
  end

  def new
    
  end

  def create
    
    @venue.user = current_user
  
    if @venue.save
      redirect_to @venue, :notice => "Successfully created venue."
    else
      render :action => 'new'
    end
  end

  def edit
  
  end

  def update
  
    if @venue.update_attributes(params[:venue])
      redirect_to @venue, :notice  => "Successfully updated venue."
    else
      render :action => 'edit'
    end
  end

  def destroy
  
    @venue.destroy
    redirect_to venues_url, :notice => "Successfully destroyed venue."
  end
end
