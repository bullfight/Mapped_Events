module VenuesHelper
  
  def venueFeatureCollection venues
    array = []
    venues.each do |v| 
      array << venueFeature( v )
    end
    return FeatureCollection.new(array)    
  end
  
  def venueFeature v
    Feature.new(
      Point.from_coordinates([v.longitude, v.latitude]), 
      {:name => v.name, :description => v.description, 
       :street_address => v.street_address, :city => v.city, 
       :postcode => v.postcode, :country => v.country, 
       :description => v.description, :created_at => v.created_at,
       :updated_at => v.created_at}, v.id
    )
  end
  
end