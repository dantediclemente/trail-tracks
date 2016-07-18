class Trail < ActiveRecord::Base

  validates :name, presence: true
  validates :park_name, presence: true
  validates :distance, presence: true
  validates :date_hiked, presence: true
  validates :hiked, presence: true, inclusion: { in: [ true, false ] }
  validates :rating, numericality: { inclusion: 1..10 }
end
