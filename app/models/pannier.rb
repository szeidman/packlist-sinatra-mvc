class Pannier < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :name, presence: {message: "Please enter a name."}
  validates :location, presence: {message: "Please choose a location."}

end
