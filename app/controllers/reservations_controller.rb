class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[destroy]
  
  def create
    @‌reservation = current_user.reservations.build(reservation_params)
  if @‌reservation.save
    redirect_to dashboard_path, notice: 'Réservation effectuée.'
  else
    redirect_to experiences_path, alert: 'Erreur lors de la réservation.'
  end
end
  
  def destroy
    @‌reservation.destroy
    redirect_to dashboard_path, notice: 'Réservation annulée.'
  end
  
  private

  def set_reservation
    @‌reservation = current_user.reservations.find(params[:id])
  end
  
  def reservation_params
  params.require(:reservation).permit(:experience_id, :reservation_date)
  end
end
    