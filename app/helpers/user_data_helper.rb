module UserDataHelper
  def correct_user?
    remember_token = User.encrypt(cookies[:remember_token])
    
    @current_user = User.find_by(remember_token: remember_token)
    
    if @current_user[:email] == 'saluma1@live.com'
      return true
    end
  end
end
