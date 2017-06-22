class User < ActiveRecord::Base
  has_secure_password
  has_many :panniers
  has_many :items, through: :panniers

  validates_presence_of :username

end
