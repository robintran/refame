class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_user!

  def create
    render :json => register_with_email(params)
  end

  private

  def register_with_email(params)
    user = User.new(params[:user])
    if user.save
      sign_in(:user, user)
      { :success => true, :msg => "Please check your email #{user.email}. We have sent a confirmation instruction there.",
                          :path => main_app.root_path }
    else
      { :success => false, :msg => user.get_errors }
    end
  end
end