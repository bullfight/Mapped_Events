class Venue < ActiveRecord::Base
  attr_accessible :name, :description, :street_address, :city, :postcode, :country
  geocoded_by :address
  after_validation :geocode 
  
  has_many :posts
  belongs_to :user
  
  validates_presence_of :name, :street_address, :city, :postcode, :country
  
  def self.search(query)
    where("name like ?", "%#{query}%")
  end
  
  private
  def address
    [street_address, city, postcode, country].compact.join(', ')
  end
end
