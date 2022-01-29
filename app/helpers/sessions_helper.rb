module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
    cookies.encrypted[:user_id] = user.id
  end

  def current_user
    @current_user ||= user.find(session[:user_id])
  end

  def authenticate!
    store_location
    return unless session[:user_id].nil?

    flash[:error] = I18n.t('users.messages.you_need_sign_in')
    redirect_to sign_in_path
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end