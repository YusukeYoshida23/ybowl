require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create(:user)}
  
  describe 'ユーザー登録' do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(user).to be_valid
    end
  end
  
#  describe 'ログイン' do end


end
