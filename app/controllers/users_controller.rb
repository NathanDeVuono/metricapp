class UsersController < ApplicationController
  def new
    remember_token = User.encrypt(cookies[:remember_token])
      if !User.find_by(remember_token: remember_token).nil? && (User.find_by(remember_token: remember_token)[:user_id] == 3)
        
        @current_user = User.find_by(remember_token: remember_token)
        @user_id = @current_user[:id]
      else
        flash[:error] = "Users controller says you aren't the right person!"
        redirect_to signin_path
      end
  end
  def create
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash.now[:success] = "Welcome to Metrics"
        redirect_to "/user_data"
      else
        render 'new'
      end
  end

end
