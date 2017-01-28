class Profile::CategoriesController < Profile::ApplicationController

  def index
    @user = User.find(current_user)
    @categories = Category.all
  end
end