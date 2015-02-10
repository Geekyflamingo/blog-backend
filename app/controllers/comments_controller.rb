class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    render json: Comment.all, except: [:users, :posts]
  end

  def show
    render json: @comment
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors
    end
  end

  def update
    @comment.update(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors
    end
  end

  def destroy
    if @comment.destroy
      head :no_content
    else
      render json: @comment.errors
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
