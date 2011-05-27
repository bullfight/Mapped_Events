module PostsHelper

  def postsFeatureCollection posts
    array = []
    posts.each do |p| 
      array << postFeature( p )
    end
    return FeatureCollection.new(array)    
  end

  def postFeature p
    Feature.new(
      Point.from_coordinates([p.venue.longitude, p.venue.latitude]), {}, p.id
    )
  end

end
