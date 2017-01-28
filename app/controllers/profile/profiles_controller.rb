class Profile::ProfilesController < Profile::ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user)
  end
end