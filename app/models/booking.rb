class Booking < ApplicationRecord
  STATUSES = %w(Pending Approved Cancelled Completed)
  belongs_to :plant
  belongs_to :user
  has_one :review, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: STATUSES }
end
