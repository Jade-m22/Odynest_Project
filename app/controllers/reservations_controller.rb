class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[destroy]

  def create
    @experience = Experience.find(params[:experience_id])
    @reservation = current_user.reservations.build(
      experience: @experience,
      reservation_date: params[:reservation][:reservation_date]
    )

    if @reservation.save
      redirect_to user_dashboard_path, notice: "R\u00E9servation effectu\u00E9e avec succ\u00E8s."
    else
      redirect_to experience_path(@experience), alert: "Erreur lors de la r\u00E9servation."
    end
  end

  def destroy
    @reservation.destroy
    redirect_to dashboard_path, notice: "R\u00E9servation annul\u00E9e."
  end

  def index
    @experience = Experience.find(params[:experience_id])
    @reservations = @experience.reservations
  end

  private

  def set_reservation
    @reservation = current_user.reservations.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:experience_id, :reservation_date)
  end
end
