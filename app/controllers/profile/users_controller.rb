class Profile::UsersController < Profile::ApplicationController

  def index
    @users = User.all
  end

  def show
    @posts = Post.where(user_id: params[:id], status: ['published', 'rejected', 'pending_review'])
  end
end