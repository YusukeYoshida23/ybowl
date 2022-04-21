require 'rails_helper'

RSpec.describe "User", type: :system do
  describe "GET #show" do
    let(:user) { create(:user)}

    before do
      get user_path(user.id)
      visit user_path(user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    it "returns user information" do
      expect(page).to have_content(user.name)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.favorite_ball)
    end
  end
end
