class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true
  validates :category, presence: true, inclusion: { in: %w(Indoor House Office Outdoor Carnivorous Flower) }

  include PgSearch::Model
  pg_search_scope :search_full_text,
    against: {
      name: 'A',
      description: 'B',
      category: 'C'
    },
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
