class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates :email, :presence => true, :uniqueness => true
  validates :password, :length => { :minimum => 6}
  
  before_create { generate_token(:auth_token) }
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  
end
