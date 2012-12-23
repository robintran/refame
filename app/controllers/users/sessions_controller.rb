class Users::SessionsController < Devise::SessionsController

  def create
    resource = catch(:warden)  { warden.authenticate!(:scope => resource_name, :recall => 'sessions#failure') }
    case
      when resource[:recall].present?
        failure
      when resource[:message] == :unconfirmed
        unconfirmed
      else
        sign_in_and_redirect(resource_name, resource)
    end
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => { :success => true, :path => resource.has_role?('refinery') ?
                                                        refinery.admin_root_path :
                                                        refinery.root_path }
  end

  def unconfirmed
    return render :json => { :success => false, :errors => 'Please confirm your account to continue' }
  end

  def failure
    return render :json => { :success => false, :errors => 'Wrong email or password. Please try again' }
  end
end