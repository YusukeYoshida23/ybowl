require 'rails_helper'

RSpec.describe "Scores", type: :system do
  let(:score) { create(:score)}
  let(:user) { create(:user)}
  let(:bowling_center) { create(:bowling_center)}

  
  # describe "GET #index" do

  #   before do
  #     get bowling_center_scores_path(bowling_center.id)
  #     visit bowling_center_scores_path(bowling_center.id)
  #   end

  #   it "returns http success" do
  #     expect(response).to have_http_status(200)
  #   end

  #   it "ゲーム数、投球日時、点数が表示されている" do
  #     expect(page).to have_content(score.id)
  #     expect(page).to have_content(score.create_at)
  #     expect(page).to have_content(score.point)
  #   end

    #編集へ飛ぶ
    
    #削除動作機能がしている

    #MAXが機能している

    #AVEが機能している

    #スコアを入力するが機能している

    #ボウリング場詳細に戻るが機能している

    #ボウリング場一覧が機能している

    #トップ画面に戻るが機能している


  # end

  # describe "GET #show" do
  #   before do
  #     get bowling_center_score_path(bowling_center.id, score.id)
  #     visit bowling_center_score_path(bowling_center.id, score.id)
  #   end

  #   it "returns http success" do
  #     expect(response).to have_http_status(200)
  #   end

  #   it "ゲーム数、投球日時、点数が表示されている" do
  #     expect(page).to have_content(index)
  #     expect(page).to have_content(score.create_at)
  #     expect(page).to have_content(score.point)
  #   end

    #編集へ飛ぶ
    
    #削除動作機能がしている

    #MAXが機能している

    #AVEが機能している

    #スコアを入力するが機能している

    #ボウリング場詳細に戻るが機能している

    #ボウリング場一覧が機能している

    #トップ画面に戻るが機能している

  # end

  describe "GET #new" do
    before do
      get new_bowling_center_score_path(bowling_center.id)
      visit new_bowling_center_score_path(bowling_center.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    #点数入力動作が機能している new→create→show
  end

  describe "GET #edit" do

  #更新するが機能している


  end
end
