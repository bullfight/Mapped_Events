class Post < ActiveRecord::Base
  attr_accessible :name, :description, :rsvp_by, :date_of,  :contact, 
    :category_id, :category_attributes, :venue_id, :venue_attributes
  
  belongs_to :user
  belongs_to :category
  belongs_to :venue
  
  validates_presence_of :name, :date_of, :contact, :venue_id
  
  accepts_nested_attributes_for :category, :venue
  
  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
