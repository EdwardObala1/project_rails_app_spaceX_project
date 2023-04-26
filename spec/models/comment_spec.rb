require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment' do
    it 'cannot be added if not tied to user' do
      comment = build(:comment, user_id: nil)
      expect(comment).to_not be_valid
    end

    it 'cannot be added if comment text not added' do
      comment = build(:comment, comment: nil)
      expect(comment).to_not be_valid
    end
  end

  it 'is valid when conditions for users and comment text are met' do
    comment = build(:comment)
    expect(comment).to be_valid
  end
end
