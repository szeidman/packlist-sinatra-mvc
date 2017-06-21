class User < ActiveRecord::Base
  has_secure_password
  has_many :panniers
  has_many :items, through: :panniers

  validates :username, presence: {message: "Please enter a username."}
  validates :password_digest, presence: {message: "Please enter a password."}

end
