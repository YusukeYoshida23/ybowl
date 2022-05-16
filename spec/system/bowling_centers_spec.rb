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
      expect(response).to have_http_status(200)
    end

    it "ボウリング場名をクリックするとボウリング場詳細に移動する" do
      click_on bowling_center.name
      expect(current_path).to eq bowling_center_path
    end
  
  #削除が機能している
  
    it "「ボウリング場を登録する」が機能している" do
      within("#new_bowling_center") do
        click_on "ボウリング場を登録する"
      end
      expect(current_path).to eq new_bowling_center_path
    end

    it "「トップに戻る」が機能している" do
      within("#root") do
        click_on "トップに戻る"
      end
      expect(current_path).to eq root_path
    end
  end

  describe "GET #new" do
    before do
      get new_bowling_center_path
      visit new_bowling_center_path
    end

    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    # クリエイトアクションのテスト new→create→show

    #ボウリング場一覧が機能している
    
    #トップに戻るが機能している
    
  end


  describe "GET #show" do
    before do
      get bowling_center_path(bowling_center.id)
      visit bowling_center_path(bowling_center.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    it "returns bowling_center information" do
      expect(page).to have_content(bowling_center.name)
      expect(page).to have_content(bowling_center.address)
      expect(page).to have_content(bowling_center.phone_number)
      expect(page).to have_content(bowling_center.hp)
    end

    # it '入力した住所を基に地図が表示される' do end

    #スコアを入力するが機能している

    #スコア一覧を見るが機能している

    #ボウリング場一覧に戻るが機能している

    #トップに戻るが機能している
  end
  
end
