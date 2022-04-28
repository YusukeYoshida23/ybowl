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
    click_on 'ボウリング場を登録する'
    expect(page).to eq "/bowling_centers/new"
  end

  it "「ボウリング場一覧」が機能している" do
    click_on 'ボウリング場一覧'
    expect(page).to eq "/bowling_centers"
  end
end
