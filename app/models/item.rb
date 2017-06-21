class Item < ActiveRecord::Base
  belongs_to :pannier

  validates :name, presence: {message: "Please enter a name."}
  validates :weight, numericality: {message: "Weight needs to be a number."}
  validates :pannier_id, numericality: {message: "Please choose or add a pannier for this item."}
end
