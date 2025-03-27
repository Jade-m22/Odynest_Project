class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  after_commit :send_confirmation_email, on: :create

  validates :reservation_date, presence: true
  validate :reservation_date_must_be_valid

  def reservation_date_must_be_valid
    return unless experience # Ne fait rien si l'expérience est `nil`

    valid_dates = [ experience.start_date_1, experience.start_date_2, experience.start_date_3 ].compact
    return if valid_dates.include?(reservation_date)

    errors.add(:reservation_date, "n'est pas une date valide pour cette expérience")
  end

  enum :status, { pending: 0, confirmed: 1, canceled: 2 }

  private

  def send_confirmation_email
    UserMailer.reservation_confirmation(self).deliver_now
  end
end
