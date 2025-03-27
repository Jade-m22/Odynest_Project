class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update destroy show]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Compte utilisateur cr\u00E9\u00E9 avec succ\u00E8s."
    else
      render :new
    end
  end

  def dashboard
    if current_user.is_admin?
      @experiences = Experience.includes(:users)
      @users = User.all
      @providers = Provider.all
    else
      @reservations = current_user.reservations.includes(:experience).where("reservation_date >= ?", Date.today)
      @past_reservations = current_user.reservations.includes(:experience).where("reservation_date < ?", Date.today)
      @experiences = @reservations.map(&:experience)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_dashboard_path, notice: "Profil mis \u00E0 jour."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Compte supprim\u00E9."
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path, alert: "Utilisateur introuvable." unless @user
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
