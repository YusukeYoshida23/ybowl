require 'rails_helper'

RSpec.describe "Home", type: :system do

  before do
    visit root_path
  end

  it "root_pathが機能している" do
    expect(page).to have_content "ボウリング場を登録する"
    expect(page).to have_content "ボウリング場一覧"
  end

  it "「ボウリング場を登録する」が機能している" do
    within("#new_bowling_center") do
      click_on "ボウリング場を登録する"
    end
    expect(page).to have_current_path new_bowling_center_path, ignore_query: true
  end

  it "「ボウリング場一覧」が機能している" do
    within("#bowling_centers") do
      click_on "ボウリング場一覧"
    end
    expect(page).to have_current_path bowling_centers_path, ignore_query: true
  end
end
