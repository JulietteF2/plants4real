class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true
  validates :category, presence: true
end
