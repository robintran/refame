module RefineryPatch

  def current_refinery_user
    current_user
  end

  def refinery_user_signed_in?
    user_signed_in?
  end

  def refinery_user?
    refinery_user_signed_in? && current_refinery_user.has_role?(:refinery)
  end

  def authenticate_refinery_user!
    authenticate_user!
  end

  def store_location
    session[:return_to] = request.fullpath.sub("//", "/")
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end

