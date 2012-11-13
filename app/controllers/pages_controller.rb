class PagesController < ApplicationController
  
  def index
    @category_roots = Category.roots    
  end
  
end
