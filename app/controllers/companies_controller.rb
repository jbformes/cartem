class CompaniesController < ApplicationController
  
  before_filter :load_resources, :only => [:index]
  
  def index
    @companies = Company.scoped
    if params[:category_id].present?
      category = Category.find(params[:category_id])
      @companies = @companies.in_categories(category.descendants)
    end
    respond_with @companies
  end

  def show
    @company = Company.find(params[:id])
    respond_with @company
  end

  def load_resources
    # @category = Category.find(params[:category_id]) if params[:category_id]
    @category_roots = Category.roots
  end

end
