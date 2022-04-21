require 'rails_helper'

RSpec.describe "BowlingCenters", type: :system do
  let(:bowling_center) { create(:bowling_center)}

  before do
    get bowling_center_path(bowling_center.id)
    visit bowling_center_path(bowling_center.id)
  end

  describe "GET #show" do
    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    it "returns bowling_center information" do
      expect(page).to have_content(bowling_center.name)
      expect(page).to have_content(bowling_center.address)
      expect(page).to have_content(bowling_center.phone_number)
      expect(page).to have_content(bowling_center.hp)
    end
  end
  
end
