class Admin::CategoriesController < Admin::AdminController

  def index
    @categories = Category.all
    respond_with @categories
  end

  def show
    @category = Category.find(params[:id])
    respond_with @category
  end

  def new
    @category = Category.new
    respond_with @category
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    flash[:notice] = "Categoria Adicionada." if @category.save 
    respond_with @category, :location => admin_category_path

  end

  def update
    @category = Category.find(params[:id])
    flash[:notice] ="Categoria Atualizada." if update_attributes(params[:category])
    respond_with @category, :location => admin_categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with @category, :location => admin_categories_path
  end
end
