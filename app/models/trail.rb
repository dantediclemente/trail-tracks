class Trail < ActiveRecord::Base
  RATING = [
  [1, "1"],
  [2, "2"],
  [3, "3"],
  [4, "4"],
  [5, "5"],
  [6, "6"],
  [7, "7"],
  [8, "8"],
  [9, "9"],
  [10, "10"]
]

  validates :name, presence: true
  validates :park_name, presence: true
  validates :distance, presence: true
  validates :date_hiked, presence: true
  validates :hiked, presence: true, inclusion: { in: [ true, false ] }
  validates :rating, numericality: { inclusion: 1..10 }
end
