class Item < ActiveRecord::Base
  belongs_to :pannier

  validates_presence_of :name
  validates_numericality_of :weight, message: "needs to be a number."
  validates_numericality_of :pannier_id, message: "must be chosen or added for this item."
end
