include Warden::Test::Helpers
 
module SystemHelpers
  def login(user)
    login_as user, scope: :user
  end
end
