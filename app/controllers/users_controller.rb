class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy dashboard]
  before_action :authorize_admin!, only: %i[destroy]
  before_action :authenticate_user! 

  helper_method :user_signed_in?, :current_user
  
  def new
    @‌user = User.new
  end
  
  def create
    @‌user = User.new(user_params)
    if @‌user.save
      redirect_to root_path, notice: 'Compte utilisateur créé avec succès.'
    else
      render :new
    end
  end
  
  def show
  end
  
  def dashboard
    if current_user.admin?
      @‌experiences = Experience.all
      @‌reservations = Reservation.all
    else
      @‌reservations_current = current_user.reservations.where("reservation_date >= ?", Time.now)
      @‌reservations_past = current_user.reservations.where("reservation_date < ?", Time.now)
    end
  end
  
  def edit
  end
  
  def update
    if @‌user.update(user_params)
      redirect_to dashboard_path, notice: 'Profil mis à jour.'
    else
      render :edit
    end
  end
  
  def destroy
    @‌user.destroy
    redirect_to root_path, notice: 'Compte supprimé.'
  end
  
  private

  def set_user
    @‌user = current_user
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :admin)
  end
  
  def authorize_admin!
    redirect_to root_path unless current_user.admin?
    end
  end