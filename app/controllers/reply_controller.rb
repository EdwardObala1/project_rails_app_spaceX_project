class ReplyController < ApplicationController
  def show
    @replies = Reply.all
  end

  def create
    @reply = Reply.new(params.require(:reply).permit(:user_id, :reply))
  end

  def update
    @reply = Reply.find_by(id: params[:id])
    @reply.update(reply: params[:reply][:reply])
  end

  def destroy
    @reply = Reply.find_by(id: params[:id])
    @reply.destroy
  end
end
