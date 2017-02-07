class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @search = Post.search(params[:q])
    if params[:category_id]
      @posts = @search.result.where(category_id: params[:category_id], status: 'published')
    else
      @posts = @search.result.where(status: 'published')
    end
    @posts = @posts.page(params[:page]).per(4)
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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.edit!
    if @post.update(post_params)      
      redirect_to profile_posts_path
    else
      render 'edit'
    end
  end

  def review
    @post = Post.where(id: params[:post_id]).first
    @post.review!

    redirect_to profile_posts_path
  end

  def archive
    @post = Post.where(id: params[:post_id]).first
    @post.archive!

    redirect_to profile_posts_path
  end

  def publish
    @post = Post.where(id: params[:post_id]).first
    @post.publish!

    redirect_to profile_posts_path
  end

  def reject
    @post = Post.where(id: params[:post_id]).first
    @post.reject!

    redirect_to profile_posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :price, :description, :deal, :category_id, :photo)
    end
end