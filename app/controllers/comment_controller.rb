class CommentController < ApplicationController
  def show
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:user_id, :comment))
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment: params[:comment][:comment])
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
  end
end
