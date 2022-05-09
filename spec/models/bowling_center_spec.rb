require 'rails_helper'

RSpec.describe BowlingCenters, type: :model do
  let(:user) {create(:bowling_center)}
  
  describe 'ボウリング場登録' do
    it "name、addressが存在すれば登録できること" do
      expect(user).to be_valid
    end

    # it 'name、addressが無いと登録できない' do end
  end
end
