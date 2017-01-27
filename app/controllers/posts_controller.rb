class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:category_id] 
      @posts = Post.where(category_id: params[:category_id])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :price, :description, :deal, :status, :category_id, :photo)
    end
end