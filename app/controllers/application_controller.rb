class ApplicationController < ActionController::Base
  protect_from_forgery


  def current_user
    @current_user ||= Reader.find(session[:reader_id]) if session[:reader_id]
  end
  helper_method :current_user
end
