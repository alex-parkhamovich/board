class Profile::UsersController < Profile::ApplicationController

  def index
    @users = User.all
  end
end