class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from AccessDenied, with: :access_denied

  def current_user
    @current_user ||= Reader.find(session[:reader_id]) if session[:reader_id]
  end
  helper_method :current_user

protected

  def access_denied
    redirect_to access_denied_path
  end
end
