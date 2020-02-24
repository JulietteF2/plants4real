class Review < ApplicationRecord
  belongs_to :booking
  has_one :plant, through: :booking

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
