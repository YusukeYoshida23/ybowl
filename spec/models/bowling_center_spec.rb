require 'rails_helper'

RSpec.describe BowlingCenter, type: :model do
  let(:bowling_center) {create(:bowling_center)}
  
  describe 'ボウリング場登録' do
    it "name、addressが存在すれば登録できること" do
      expect(bowling_center).to be_valid
    end

    # it 'name、addressが無いと登録できない' do end
  end
end
