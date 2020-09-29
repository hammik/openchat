class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email:params[:email]) 
    
    if user&.authenticate(params[:password]) then
      session[:user_id] = user.id
      redirect_to "/home"
    else
      redirect_to login_path
      flash[:alert] = "メールアドレスかパスワードが間違っています"
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
