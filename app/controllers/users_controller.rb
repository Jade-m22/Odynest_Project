class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update destroy show]
  before_action :authorize_user, only: %i[edit update destroy]
  before_action :authorize_admin!, only: %i[index dashboard]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Compte utilisateur créé avec succès.'
    else
      render :new
    end
  end

  def dashboard
    if current_user.admin?
      @experiences = Experience.all
      @reservations = Reservation.all
      @customer_orders = Order.where.not(user: current_user) # Commandes des autres clients
    else
      @reservations_current = current_user.reservations.where("reservation_date >= ?", Time.now)
      @reservations_past = current_user.reservations.where("reservation_date < ?", Time.now)
      @orders = current_user.orders
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: 'Profil mis à jour.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Compte supprimé.'
  end

  private

  def set_user
    @user = User.find(params[:id]) # Permet à l'admin de gérer d'autres comptes
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end

  def authorize_user
    unless current_user.admin? || current_user == @user
      redirect_to root_path, alert: "Accès interdit."
    end
  end

  def authorize_admin!
    redirect_to root_path, alert: "Accès interdit." unless current_user.admin?
  end
end
