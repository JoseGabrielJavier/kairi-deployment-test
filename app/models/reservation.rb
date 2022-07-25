class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :checkin_day, presence: true
  validates :checkout_day, presence: true
  validates :total_price, presence: true
  # validate :validate_overlap

  has_many :reviews
  has_one :host_to_guest, ->{where(review_type: "host_to_guest")}, class_name: "Review"
  has_one :guest_to_host, ->{where(review_type: "guest_to_host")}, class_name: "Review"

  def period
    checkin_day..checkout_day
  end

  def validate_overlap
    reservations = room.reservations.all
    is_overlapping = reservations.each do |reservation|
      period.overlaps?(reservation.period)
    end
    errors.add(:checkin_day) if is_overlapping 
  end
end
