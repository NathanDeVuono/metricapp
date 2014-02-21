class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    remember_token = User.encrypt(cookies[:remember_token])
    if User.find_by(remember_token: remember_token).nil? || !(User.find_by(remember_token: remember_token)[:email] == 'saluma1@live.com')
      
      flash[:danger] = "Users controller says you aren't the right person!"
      redirect_to '/user_data'
    end
  end


  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = 'User '+@user[:name]+' successfully created.'
        redirect_to "/users"
      else
        render 'new'
      end
  end

  def edit
    set_user
  end

  def update
    set_user
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = 'User was successfully updated.'
        format.html { redirect_to '/users'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_user
    @user.destroy
    respond_to do |format|
      flash[:success] = 'User was successfully deleted.'
      format.html { redirect_to '/users' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user =  User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
