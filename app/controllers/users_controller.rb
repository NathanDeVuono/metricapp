class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Metrics"
        redirect_to "/user_data"
      else
        render 'new'
      end
  end

end
