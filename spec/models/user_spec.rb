require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create(:user)}
  
  describe 'ユーザー登録' do
    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      expect(user).to be_valid
    end

    # it '各項目に入力ミスが有ると登録できない' do end
  end
  
#  describe 'ログイン' do 
# it 'emailとpasswordが合っていればログインできること' do end
# it 'emailとpasswordを入力しないとログインできない' do end
# it 'emailとpasswordが間違っているとログインできない' do end
# end


end
