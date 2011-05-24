class Post < ActiveRecord::Base
  attr_accessible :name, :rsvp_by, :date_of,  :contact, :category_id, :description
  
  belongs_to :user
  belongs_to :category
  
  validates_presence_of :name, :date_of, :contact
end
