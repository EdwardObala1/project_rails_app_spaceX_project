require 'rails_helper'

RSpec.describe "Replies", type: :request do
  describe "Replies" do
    it '/post create a new reply' do
      replies = create(:reply)
      params = {reply: {reply: replies.reply, comment_id: replies.comment_id}}
      post replies_path(params)

      reply_count = Reply.count
      expect(response.status).to eq(204)
      expect(reply_count).to_not eq(0)
    end

    it '/update updates an existing reply' do
      replies = create(:reply, id: 1)
      params = {id: 1, reply: {reply: 'this is a new reply update'}}
      patch update_reply_path(params)
      expect(response.status).to eq(204)
      reply_text = Reply.where(id: 1).pluck(:reply).join
      expect(reply_text).to eq('this is a new reply update')
    end

    it '/destroy destroys an existing reply' do
      replies = create(:reply, id: 1)
      params = {id: 1}
      delete reply_path(params)
      expect(response.status).to eq(204)
      reply = Reply.count
      expect(reply).to eq(0)
    end
  end
end
