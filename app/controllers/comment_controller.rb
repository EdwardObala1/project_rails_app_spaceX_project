class CommentController < ApplicationController
  def show
    @comments = Comment.all
  end

  def create
    # binding.pry
    @comment = Comment.new(params.require(:comment).permit(:comment))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to request.referrer, notice: "Changes saved successfully"
    else
      render html: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.update(comment: params[:comment][:comment])
    if @comment.save
      redirect_to request.referrer, notice: "Changes saved successfully"
    else
      render html: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    if @comment.save
      redirect_to request.referrer, notice: "Changes saved successfully"
    else
      render html: @comment.errors, status: :unprocessable_entity
    end
  end
end
