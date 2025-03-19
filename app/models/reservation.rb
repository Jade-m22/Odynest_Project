class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  
  validates :selected_date, presence: true
  validate :selected_date_must_be_valid
  
  def selected_date_must_be_valid
  return if experience.available_dates.include?(selected_date)
  
  errors.add(:selected_date, "n'est pas une date valide pour cette expérience")
  
  end
  
  enum status: { pending: "pending", confirmed: "confirmed", canceled: "canceled" }
  end