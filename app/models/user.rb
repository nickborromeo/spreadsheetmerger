class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates :email, :presence => true
  validates :password, :presence => { :on => :create }, :length => { :minimum => 6}
end
