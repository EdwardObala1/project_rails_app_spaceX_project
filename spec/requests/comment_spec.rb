require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "Comments" do
    it '/post create a new comment' do
      comments = create(:comment)
      params = {comment: {comment: comments.comment, user_id: comments.user_id}}
      post comments_path(params)

      comment_count = Comment.count
      expect(response.status).to eq(204)
      expect(comment_count).to_not eq(0)
    end

    it '/update updates an existing comment' do
      comments = create(:comment, id: 1)
      params = {id: 1, comment: {comment: 'this is a new comment update'}}
      patch update_comment_path(params)
      expect(response.status).to eq(204)
      comment_text = Comment.where(id: 1).pluck(:comment).join
      expect(comment_text).to eq('this is a new comment update')
    end

    it '/destroy destroys an existing comment' do
      comments = create(:comment, id: 1)
      params = {id: 1}
      delete comment_path(params)
      expect(response.status).to eq(204)
      comment = Comment.count
      expect(comment).to eq(0)
    end
  end
end
