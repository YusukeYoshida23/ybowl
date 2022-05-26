RSpec.shared_context "sign in" do
  visit new_user_session_path
  fill_in "session_email", with: "test1@example.com"
  fill_in "session_password", with: "test0401"
  find("#login").click
end
