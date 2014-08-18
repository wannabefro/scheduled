class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected

  def current_user
    authenticate_or_request_with_http_token do |token, options|
      User.where('authentication_token = ? AND email = ?', token, options[:user_email]).take
    end
  end
end
