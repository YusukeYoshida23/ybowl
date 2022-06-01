class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    redirect_to root_path, alert: 'ゲストユーザーは削除できません。' if resource.email == 'guest@example.com'
  end

  protected

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
end
