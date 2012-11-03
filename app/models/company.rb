class Company < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :description, :email, :name, :website, :category
end
