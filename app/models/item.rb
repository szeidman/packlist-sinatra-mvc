class Item < ActiveRecord::Base
  belongs_to :pannier

  validates :name, presence: true
  validates :weight, numericality: true
  validates_associated :items
  validates_associated :panniers
end
