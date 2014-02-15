class SessionsController < ApplicationController
  before_filter :get_current_user
  def new
    # if !@current_user.nil?
    #   flash[:success] = 'Welcome, ' + @current_user[:name]
    #   redirect_to "/user_data"
    # end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    remember_token = User.encrypt(cookies[:remember_token])
    
    if user && user.authenticate(params[:session][:password])
      # Sign in and redirect
      sign_in user
      flash[:success] = 'Welcome, ' + user[:name]
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
  protected
    def get_current_user
      remember_token = User.encrypt(cookies[:remember_token])
      @current_user = User.find_by(remember_token: remember_token)
    end
end
