module ControllerHelpers
  def login_admin
    @request.env['devise.mapping'] = Devise.mappings[:user]
    admin = FactoryGirl.create(:user, :admin)
    admin.confirm
    sign_in :user, admin # sign_in(scope, resource)
  end

  def login_user
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    user.confirm
    sign_in user
  end
end
