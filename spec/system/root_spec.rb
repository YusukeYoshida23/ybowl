require 'rails_helper'

RSpec.describe "Home", type: :system do
  let!(:user) { create(:user, email: "test1@example.com", password: "test0401") }

  before do
    visit new_user_session_path
    fill_in "session_email", with: "test1@example.com"
    fill_in "session_password", with: "test0401"
    find("#login").click
    visit root_path
  end

  it "root_pathが機能している" do
    expect(page).to have_content "ボウリング場を登録する"
    expect(page).to have_content "ボウリング場一覧"
  end

  it "「ボウリング場を登録する」が機能している" do
    click_on "ボウリング場を登録する"
    expect(page).to have_current_path new_bowling_center_path, ignore_query: true
  end

  it "「ボウリング場一覧」が機能している" do
    click_on "ボウリング場一覧"
    expect(page).to have_current_path bowling_centers_path, ignore_query: true
  end
end
