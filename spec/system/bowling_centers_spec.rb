require 'rails_helper'

RSpec.describe "BowlingCenters", type: :system do
  let!(:bowling_center) { create(:bowling_center)}
  let!(:score) { create(:score)}
  let!(:user) {create(:user, email:"test1@example.com", password:"test0401")}

  describe "GET #index" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get bowling_centers_path
      visit bowling_centers_path
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content(bowling_center.name)
      expect(page).to have_content '削除'
      expect(page).to have_content 'ボウリング場を登録する'
      expect(page).to have_content 'トップに戻る'
    end

    it "ボウリング場名をクリックするとボウリング場詳細に移動する" do
      click_on bowling_center.name, match: :first
      expect(page).to have_current_path bowling_center_path(bowling_center), ignore_query: true
    end
  
    it "「ボウリング場を登録する」が機能している" do
      click_on "ボウリング場を登録する"
      expect(page).to have_current_path new_bowling_center_path, ignore_query: true
    end

    it "「トップに戻る」が機能している" do
      click_on "トップに戻る"
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end

  describe "GET #new" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get new_bowling_center_path
      visit new_bowling_center_path
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content '(必須)ボウリング場名'
      expect(page).to have_content '(必須)住所'
      expect(page).to have_content '電話番号'
      expect(page).to have_content 'ホームページ'
      expect(page).to have_content 'ボウリング場一覧'
      expect(page).to have_content 'トップに戻る'
    end

    it "「ボウリング場一覧」が機能している" do
      click_on "ボウリング場一覧"
      expect(page).to have_current_path bowling_centers_path, ignore_query: true
    end
    
    it "「トップに戻る」が機能している" do
      click_on "トップに戻る"
      expect(page).to have_current_path root_path, ignore_query: true
    end
    
  end

  describe "POST #create" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get new_bowling_center_path
      visit new_bowling_center_path
    end

    it "ボウリング場の登録が機能している" do
      expect do
        post bowling_centers_path, params: {name: "ASDセンター", address: "大阪府大阪市西区1-2-3", phone_number: "0123456789", hp: "https://www.asd.co.jp"}
        binding.pry
      end.to change(BowlingCenter, :count).by(1)
    end

    # it "登録後のリダイレクトが機能している" do
    #   post :create
    #   expect(page).to have_current_path bowling_center_path(bowling_center)
    # end
  end


  describe "GET #show" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get bowling_center_path(bowling_center.id)
      visit bowling_center_path(bowling_center.id)
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content(bowling_center.name)
      expect(page).to have_content(bowling_center.address)
      expect(page).to have_content(bowling_center.phone_number)
      expect(page).to have_content(bowling_center.hp)
    end

    # it '入力した住所を基に地図が表示される' do 
    # end

    it "「スコアを入力する」が機能している" do
      click_on "スコアを入力する"
      expect(page).to have_current_path new_bowling_center_score_path(bowling_center), ignore_query: true
    end

    it "「スコア一覧を見る」が機能している" do
      click_on "スコア一覧を見る"
      expect(page).to have_current_path bowling_center_scores_path(bowling_center), ignore_query: true
    end

    it "「ボウリング場一覧に戻る」が機能している" do
      click_on "ボウリング場一覧に戻る"
      expect(page).to have_current_path bowling_centers_path, ignore_query: true
    end
    
    it "「トップに戻る」が機能している" do
      click_on "トップに戻る"
      expect(page).to have_current_path root_path, ignore_query: true
    end
  end

  describe "GET #edit" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get edit_bowling_center_path(bowling_center.id)
      visit edit_bowling_center_path(bowling_center.id)
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content '(必須)ボウリング場名'
      expect(page).to have_content '(必須)住所'
      expect(page).to have_content '電話番号'
      expect(page).to have_content 'ホームページ'
      expect(page).to have_content 'ボウリング場詳細に戻る'
      expect(page).to have_content 'ボウリング場一覧'
      expect(page).to have_content 'トップに戻る'
    end

    it "「ボウリング場詳細に戻る」が機能している" do
      click_on "ボウリング場詳細に戻る"
      expect(page).to have_current_path bowling_center_path(bowling_center), ignore_query: true
    end

    it "「ボウリング場一覧」が機能している" do
      click_on "ボウリング場一覧"
      expect(page).to have_current_path bowling_centers_path, ignore_query: true
    end
    
    it "「トップに戻る」が機能している" do
      click_on "トップに戻る"
      expect(page).to have_current_path root_path, ignore_query: true
    end
  
  end

  describe "PATCH #update" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get edit_bowling_center_path(bowling_center.id)
      visit edit_bowling_center_path(bowling_center.id)
    end

    let(:update_bowling_center) do
      {
        name: "123センター",
        address: "大阪府茨木市1-2-3",
        phone_number: "0721234567",
        hp: "https://www.123.co.jp"
      }
    end

    it "ボウリング場の更新が機能している" do
      expect do
        patch bowling_center_path, params:{id: bowling_center.id, bowling_center: update_bowling_center}
      end.to change(BowlingCenter, :count).by(0)
    end
  end

  describe "DELETE #destroy" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get bowling_centers_path
      visit bowling_centers_path
    end

    it "ボウリング場の削除が機能している" do
      expect do
        bowling_center.destroy
      end.to change(BowlingCenter, :count).by(-1)
    end

    it "削除後のリダイレクトが機能している" do
      bowling_center.destroy
      expect(page).to have_current_path bowling_centers_path
    end
  end
  
end
