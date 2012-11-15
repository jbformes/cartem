class Company < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :description, :email, :name, :website, :category_id, :phone
  
  validates_presence_of :name, :address, :phone
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  validates_associated :category
  
  scope :in_categories, lambda { |categories|
    where(:category_id => categories)  # accepts one or an array of either integers or Categories
  }
  
  scope :search, lambda { |terms| 
     where("title LIKE :t OR body LIKE :t", :t => "%#{terms}%")
  }
  
end
