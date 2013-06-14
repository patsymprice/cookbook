class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to recipes_path,  :notice => "You are logged in"
      else
        flash.now[:notice] = "Your email or password is not correct."
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to recipes_path, :notice => "You are logged out"
  end
end
