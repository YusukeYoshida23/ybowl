require 'rails_helper'

RSpec.describe "Scores", type: :system do
  let!(:bowling_center) { create(:bowling_center)}
  let!(:user) {create(:user, email: "test1@example.com", password: "test0401")}
  let!(:score) { create(:score, user_id: user.id, bowling_center_id: bowling_center.id)}

  describe "GET #index" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      get bowling_center_scores_path(bowling_center.id)
      visit bowling_center_scores_path(bowling_center.id)
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content(score.id)
      expect(page).to have_content(score.created_at.strftime("%Y年%m月%d日 %H時%M分"))
      expect(page).to have_content(score.point)
    end

    it "編集へ飛ぶ" do
      click_on "編集"
      expect(page).to have_current_path edit_bowling_center_score_path(bowling_center, score), ignore_query: true
    end

    it "スコアを入力するが機能している" do
      click_on "スコアを入力する"
      expect(page).to have_current_path new_bowling_center_score_path(bowling_center), ignore_query: true
    end

    it "ボウリング場詳細に戻るが機能している" do
      click_on "ボウリング場詳細に戻る"
      expect(page).to have_current_path bowling_center_path(bowling_center), ignore_query: true
    end

    it "ボウリング場一覧が機能している" do
      click_on "ボウリング場一覧"
      expect(page).to have_current_path bowling_centers_path, ignore_query: true
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
      get new_bowling_center_score_path(bowling_center.id)
      visit new_bowling_center_score_path(bowling_center.id)
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content "スコア入力"
      expect(page).to have_content "点数"
      expect(page).to have_content "ボウリング場詳細に戻る"
      expect(page).to have_content "ボウリング場一覧"
      expect(page).to have_content "トップに戻る"
    end

    it "ボウリング場詳細に戻るが機能している" do
      click_on "ボウリング場詳細に戻る"
      expect(page).to have_current_path bowling_center_path(bowling_center), ignore_query: true
    end

    it "ボウリング場一覧が機能している" do
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
      get new_bowling_center_score_path(bowling_center)
      visit new_bowling_center_score_path(bowling_center)
    end

    it "スコアの登録が機能している" do
      expect do
        fill_in "point", with: "150"
        click_on "登録する"
      end.to change(Score, :count).by(1)
    end

    it "登録後のリダイレクトが機能している" do
      fill_in "point", with: "150"
      click_on "登録する"
      expect(page).to have_current_path bowling_center_scores_path(bowling_center), ignore_query: true
    end
  end

  describe "GET #edit" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      visit new_bowling_center_score_path(bowling_center)
      fill_in "point", with: "150"
      click_on "登録する"
      get edit_bowling_center_score_path(bowling_center, score)
      visit edit_bowling_center_score_path(bowling_center, score)
    end

    it "ページ内の情報が表示されている" do
      expect(page).to have_content "スコア編集"
      expect(page).to have_content "点数"
      expect(page).to have_content "スコア一覧を見る"
      expect(page).to have_content "ボウリング場詳細に戻る"
      expect(page).to have_content "ボウリング場一覧"
      expect(page).to have_content "トップに戻る"
    end

    it "スコア一覧を見るが機能している" do
      click_on "スコア一覧を見る"
      expect(page).to have_current_path bowling_center_scores_path(bowling_center, score), ignore_query: true
    end

    it "ボウリング場詳細に戻るが機能している" do
      click_on "ボウリング場詳細に戻る"
      expect(page).to have_current_path bowling_center_path(bowling_center), ignore_query: true
    end

    it "ボウリング場一覧が機能している" do
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
      visit new_bowling_center_score_path(bowling_center)
      fill_in "point", with: "150"
      click_on "登録する"
      get edit_bowling_center_score_path(bowling_center, score)
      visit edit_bowling_center_score_path(bowling_center, score)
    end

    let(:update_score) do
      { point: 180 }
    end

    it "スコアの更新が機能している" do
      expect do
        patch bowling_center_score_path params: { id: score.id, score: update_score }
      end.to change(Score, :count).by(0)
    end
  end

  describe "DELETE #destroy" do
    before do
      visit new_user_session_path
      fill_in "session_email", with: "test1@example.com"
      fill_in "session_password", with: "test0401"
      find("#login").click
      visit new_bowling_center_score_path(bowling_center)
      fill_in "point", with: "150"
      click_on "登録する"
      get bowling_center_scores_path(bowling_center.id)
      visit bowling_center_scores_path(bowling_center.id)
    end

    it "スコアの削除が機能している" do
      expect do
        score.destroy
      end.to change(Score, :count).by(-1)
    end

    it "削除後のリダイレクトが機能している" do
      score.destroy
      expect(page).to have_current_path bowling_center_scores_path(bowling_center.id)
    end
  end

end
