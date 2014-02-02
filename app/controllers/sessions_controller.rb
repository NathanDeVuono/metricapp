class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      # Sign in and redirect
      sign_in user
      flash.now[:success] = 'Welcome, ' + user[:name]
      redirect_to "/user_data"
    else
      flash.now[:danger] = 'Incorrect email or password'
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
