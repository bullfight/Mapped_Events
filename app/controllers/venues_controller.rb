class VenuesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    @venues = Venue.search(params[:search])#, :order => :date_of)
        
    respond_to do |format|
      format.html
      format.json { render :partial => "venues/index.json" }
    end
    
  end
  
  def show  
    
    respond_to do |format|
      format.html
      format.json { render :partial => "venues/show.json" }
    end
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
