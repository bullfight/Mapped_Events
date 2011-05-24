class Category < ActiveRecord::Base
  attr_accessible :name, :description
  
  belongs_to :user
  has_many :posts  
  
  validates_presence_of :name
end
