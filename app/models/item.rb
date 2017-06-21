class Item < ActiveRecord::Base
  belongs_to :pannier

  validates :name, presence: true
  validates :weight, numericality: true
  validates :pannier_id, numericality: true
end
