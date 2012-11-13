class CompaniesController < ApplicationController
  
  before_filter :load_resources, :only => [:index]
  
  def index
    @companies = Company.scoped
    @companies = @companies.in_categories(@category_root.descendants) if @category_root.present?
    @companies = @category.companies if @category.present?
    @companies = @companies.paginate(:page => params[:page]) 
    #maybe the above is wrong because we already have made the search and so its doing a repeated
    # retrieve on database, now if I put it on Company.scoped.paginate it doesn't work with
    # params[:category_id]
    respond_with @companies
  end

  def show
    @company = Company.find(params[:id])
    respond_with @company
  end

  def load_resources
    # do it better
    @category_root = Category.find(params[:category_root]) if params[:category_root]
    @category = Category.find(params[:category_id]) if params[:category_id]
    @category_roots = Category.roots
  end

end
