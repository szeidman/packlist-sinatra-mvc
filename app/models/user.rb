class User < ActiveRecord::Base
  has_secure_password
  has_many :panniers
  has_many :items, through: :panniers

  validates :username, presence: true
  validates :password_digest, presence: true
  validates_associated :items
  validates_associated :panniers

end
