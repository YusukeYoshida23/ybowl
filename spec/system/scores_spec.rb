require 'rails_helper'

RSpec.describe "Scores", type: :system do
  let(:score) { create(:score)}
  let(:user) { create(:user)}
  let(:bowling_center) { create(:bowling_center)}

  describe "GET #new" do
    before do
      get new_bowling_center_score(bowling_center.id)
      visit new_bowling_center_score(bowling_center.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    #点数入力動作が機能している new→create→show
  end

  describe "GET #show" do
    before do
      get bowling_center_score_path(bowling_center.id, score.id)
      visit bowling_center_score_path(bowling_center.id, score.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    it "returns score information" do
      expect(page).to have_content(score.point)
      expect(page).to have_content(score.user_id)
      expect(page).to have_content(score.bowling_center_id)
    end

    #編集へ飛ぶ
    
    #削除動作機能がしている

    #スコアを入力するが機能している

    #トップ画面に戻るが機能している
  end
end
