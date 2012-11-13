class Company < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :description, :email, :name, :website, :category_id
  
  scope :in_categories, lambda { |categories|
    where(:category_id => categories)  # accepts one or an array of either integers or Categories
  }
  
  scope :search, lambda { |terms| 
     where("title LIKE :t OR body LIKE :t", :t => "%#{terms}%")
  }
  
end
