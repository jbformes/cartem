class Admin::CompaniesController < Admin::AdminController
  
  before_filter :load_resources, :only => [:new, :create, :edit, :update] 
  
  def index
    @companies = Company.paginate(:page => params[:page])
    respond_with @companies
  end

  def show
    @company = Company.find(params[:id])
    respond_with @company
  end

  def new

    @company = Company.new
    respond_with @company

  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    flash[:notice] = 'Empresa Adicionada' if @company.save
    respond_with @company, :location => admin_companies_path()
  end

  def update
    @company = Company.find(params[:id])
    flash[:notice] = 'Empresa Atualizada.' if @company.update_attributes(params[:company])
    respond_with @company, :location => admin_companies_path
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_with @company, :location => admin_companies_path
  end

protected
  def load_resources
    @categories = Category.all
  end
end
