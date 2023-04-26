# core functionality
# show comments
# add comment
# delete comment

class CommentController < ApplicationController
  def show
    @comments = Comment.all
  end

  def create
    @comments = Comment.new(params.require(:comment).permit(:user_id, :comment))
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
