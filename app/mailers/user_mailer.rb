class UserMailer < ApplicationMailer
  default from: "contact@odynest.fr"

  def reservation_confirmation(reservation)
    @user = reservation.user
    @experience = reservation.experience
    @reservation = reservation

    mail(to: @user.email, subject: "Confirmation de votre réservation pour #{@experience.title}")
  end
end
