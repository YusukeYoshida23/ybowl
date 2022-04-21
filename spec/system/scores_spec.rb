require 'rails_helper'

RSpec.describe "Scores", type: :system do
  let(:score) { create(:score)}
  let(:user) { create(:user)}
  let(:bowling_center) { create(:bowling_center)}

  before do
    get score_path(score.id)
    visit score_path(score.id)
  end

  describe "GET #show" do
    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    it "returns score information" do
      expect(page).to have_content(score.point)
      expect(page).to have_content(score.user_id)
      expect(page).to have_content(score.bowling_center_id)
    end
  end
end
