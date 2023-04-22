require 'rails_helper'

RSpec.describe User, type: :model do
  describe "perform tests on User model to make sure no entry is validated" do
    it 'without the user_name' do
      begin 
        user = create(:user, user_name: nil)
      rescue ActiveRecord::StatementInvalid
        expect(user).to eq(nil)
      end
    end

    it 'with a duplicated email' do
      begin 
        user = create(:user)
        user1 = create(:user)
      rescue ActiveRecord::RecordInvalid
        expect(user1).to eq(nil)
      end
    end
 
    it 'with a password that does not meet the standards' do
      begin 
        user = create(:user,password: 'testp')
      rescue ActiveRecord::RecordInvalid
        expect(user).to eq(nil)
      end
      expect(user).to eq(nil)
    end
  end
end
