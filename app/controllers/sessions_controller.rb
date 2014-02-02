class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      # Sign in and redirect
      sign_in user
      redirect_to "/user_data"
    else
      flash.now[:error] = 'Sessions Controller puking.'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
