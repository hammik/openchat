class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user = nil
    if session[:user_id] != nil then
      @current_user  =User.find_by(id:session[:user_id])
    end
  end
end
