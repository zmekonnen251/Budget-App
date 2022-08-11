class Users::SessionsController < Devise::SessionsController
  def destroy
    @user = current_user
    super
  end
end
