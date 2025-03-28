class UserMailer < ApplicationMailer
  default from: "contact.odynest@gmail.com"

  def reservation_confirmation(reservation)
    @user = reservation.user
    @experience = reservation.experience
    @reservation = reservation

    mail(from: "contact.odynest@gmail.com", to: @user.email, subject: "Confirmation de votre réservation pour #{@experience.title}")
  end
end
