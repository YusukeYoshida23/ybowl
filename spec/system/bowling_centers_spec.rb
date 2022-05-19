require 'rails_helper'

RSpec.describe "BowlingCenters", type: :system do
  let!(:bowling_center) { create(:bowling_center)}
  let!(:score) { create(:score)}

  describe "GET #index" do
    before do
      get bowling_centers_path
      visit bowling_centers_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "ボウリング場名をクリックするとボウリング場詳細に移動する" do
      click_on bowling_center.name
      expect(page).to have_current_path bowling_center_path, ignore_query: true
    end
  
  #削除が機能している
  
    it "「ボウリング場を登録する」が機能している" do
      within("#new_bowling_center") do
        click_on "ボウリング場を登録する"
      end
      expect(page).to have_current_path new_bowling_center_path, ignore_query: true
    end

    it "「トップに戻る」が機能している" do
      within("#root") do
        click_on "トップに戻る"
      end
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end

  describe "GET #new" do
    before do
      get new_bowling_center_path
      visit new_bowling_center_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    # クリエイトアクションのテスト new→create→show

    it "「ボウリング場一覧」が機能している" do
      within("#bowling_centers") do
        click_on "ボウリング場一覧"
      end
      expect(page).to have_current_path bowling_centers_path, ignore_query: true
    end
    
    it "「トップに戻る」が機能している" do
      within("#root") do
        click_on "トップに戻る"
      end
      expect(page).to have_current_path root_path, ignore_query: true
    end
    
  end


  describe "GET #show" do
    before do
      get bowling_center_path(bowling_center.id)
      visit bowling_center_path(bowling_center.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "returns bowling_center information" do
      expect(page).to have_content(bowling_center.name)
      expect(page).to have_content(bowling_center.address)
      expect(page).to have_content(bowling_center.phone_number)
      expect(page).to have_content(bowling_center.hp)
    end

    # it '入力した住所を基に地図が表示される' do end

    it "「スコアを入力する」が機能している" do
      within("#new_score") do
        click_on "スコアを入力する"
      end
      expect(page).to have_current_path new_bowling_center_score_path, ignore_query: true
    end

    it "「スコア一覧を見る」が機能している" do
      within("#scores") do
        click_on "スコア一覧を見る"
      end
      expect(page).to have_current_path bowling_center_score_path, ignore_query: true
    end

    it "「ボウリング場一覧に戻る」が機能している" do
      within("#bowling_centers") do
        click_on "ボウリング場一覧に戻る"
      end
      expect(page).to have_current_path bowling_centers_path, ignore_query: true
    end
    
    it "「トップに戻る」が機能している" do
      within("#root") do
        click_on "トップに戻る"
      end
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end
  
end
