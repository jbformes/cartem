class CompaniesController < ApplicationController
  
  before_filter :load_resources, :only => [:new, :create, :edit, :update] 
  
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

protected
  def load_resources
    @categories = Category.all
  end


end
