class Pannier < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :name, presence: true
  validates :location, presence: true
  
end
