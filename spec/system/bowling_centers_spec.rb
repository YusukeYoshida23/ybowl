require 'rails_helper'

RSpec.describe "BowlingCenters", type: :system do
  let(:bowling_center) { create(:bowling_center)}

  describe "GET #index" do

  #showアクションのテスト
  
  #削除が機能している
  
  #ボウリング場を登録するが機能している
  
  #トップに戻るが機能している

  end

  describe "GET #new" do
    before do
      get new_bowling_center
      visit new_bowling_center
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
