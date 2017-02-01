class Profile::UsersController < Profile::ApplicationController

  def index
    @users = User.all
  end

  def show
    @posts = Post.all.where(user_id: params[:id], status: 'pending_review')
  end
end