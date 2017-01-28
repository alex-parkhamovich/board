class Profile::ApplicationController < ApplicationController
  layout 'profile'

  def index
    @user = User.find(current_user)
  end
end