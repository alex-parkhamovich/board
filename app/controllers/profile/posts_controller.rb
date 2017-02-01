class Profile::PostsController < Profile::ApplicationController

  def index
    if current_user.has_role? :admin
      @posts = Post.where(status: ['published', 'rejected', 'pending_review'])
    else
      @posts = Post.where(user_id: current_user.id)
    end
  end
end