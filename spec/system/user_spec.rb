require 'rails_helper'

RSpec.describe "User", type: :system do
  let(:user) { create(:user)}
  
  describe "#show" do
    context 'GET' do
      before do
        get user_path(user.id)      
      end

      it "returns http success" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "VISIT" do
      before do
        login user
        visit user_path(user.id)
      end

      it "returns user information" do
        expect(page).to have_content(user.name)
        expect(page).to have_content(user.email)
        expect(page).to have_content(user.favorite_ball)
      end

      it "「編集」が機能している" do
        click_on "編集"
        expect(page).to have_current_path edit_user_registration_path, ignore_query: true
      end
    end
  end

  describe "#Edit" do
    context 'GET' do
      before do
        get edit_user_registration_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:found)
      end
    end
  end
end
