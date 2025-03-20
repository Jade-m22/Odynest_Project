class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show edit update destroy dashboard]

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to dashboard_path, notice: 'Compte prestataire créé avec succès.'
    else
      render :new
    end
  end

  def show
  end

  def dashboard
    if current_user.admin?
      @experiences = Experience.all
      @reservations = Reservation.all
      @customer_orders = Order.where.not(user: current_user) 
    elsif current_user.provider?
      @provider_experiences = current_user.experiences 
      @provider_reservations = Reservation.where(experience_id: @provider_experiences.ids) pour les expériences du provider
    else
      @reservations_current = current_user.reservations.where("reservation_date >= ?", Time.now)
      @reservations_past = current_user.reservations.where("reservation_date < ?", Time.now)
      @orders = current_user.orders
    end
  end

  def edit
  end

  def update
    if @provider.update(provider_params)
      redirect_to dashboard_path, notice: 'Profil mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to root_path, notice: 'Compte supprimé.'
  end

  private

  def set_provider
    @provider = current_provider
  end

  def provider_params
    params.require(:provider).permit(:email, :password, :password_confirmation)
  end
end
