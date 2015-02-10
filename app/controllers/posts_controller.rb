class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    if params[:query]
      post_search = Post.where("title like ? OR body like ?", "%#{ params[:query] }%", "%#{ params[:query] }%")
      render json: post_search
    else
      render json: @posts
    end

  end

  def show
    render json: @post
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post
    else
      render json: post.errors
    end
  end

  def update
    @post.update(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors
    end
  end

  def destroy
    if @post.destroy
      head :no_content
    else
      render json: @post.errors
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
