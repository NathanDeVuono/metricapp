class UsersController < ApplicationController
  def new
    remember_token = User.encrypt(cookies[:remember_token])
      if !User.find_by(remember_token: remember_token).nil? && (User.find_by(remember_token: remember_token)[:email] == 'saluma1@live.com')
        
        @current_user = User.find_by(remember_token: remember_token)
        @user_id = @current_user[:id]
      else
        flash[:danger] = "Users controller says you aren't the right person!"
        redirect_to '/user_data'
      end
  end

  def new
    
  end

  def create
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Metrics"
        redirect_to "/users"
      else
        render 'new'
      end
  end

end
