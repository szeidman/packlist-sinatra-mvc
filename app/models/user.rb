class User < ActiveRecord::Base
  has_secure_password
  has_many :panniers
  has_many :items, through: :panniers

#Í  validates :username, presence: true
#Í  validates :password_digest, presence: true
#Í  validates_associated :items
#Í  validates_associated :panniers

end
