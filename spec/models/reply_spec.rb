require 'rails_helper'

RSpec.describe Reply, type: :model do
  describe 'Reply' do
    it 'cannot be added if not tied to user' do
      reply = build(:reply, comment_id: nil)
      expect(reply).to_not be_valid
    end

    it 'cannot be added if reply text not added' do
      reply = build(:reply, reply: nil)
      expect(reply).to_not be_valid
    end
  end

  it 'is valid when conditions for users and reply text are met' do
    reply = build(:reply)
    expect(reply).to be_valid
  end
end
