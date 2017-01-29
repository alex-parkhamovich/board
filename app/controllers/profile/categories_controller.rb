class Profile::CategoriesController < Profile::ApplicationController

  def index
    @categories = Category.all
  end
end