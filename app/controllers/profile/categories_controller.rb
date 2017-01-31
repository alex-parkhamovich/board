class Profile::CategoriesController < Profile::ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit 
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to profile_categories_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end