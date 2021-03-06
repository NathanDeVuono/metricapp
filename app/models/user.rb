class User < ActiveRecord::Base
  has_one :goal
  validates :name, presence: true, length: { maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
  has_secure_password

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def User.new_remember_token

    SecureRandom.urlsafe_base64
    
  end

  def User.encrypt(token)

    Digest::SHA1.hexdigest(token.to_s)
    
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
