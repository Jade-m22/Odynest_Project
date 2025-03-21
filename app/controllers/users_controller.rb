class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update destroy show]
  before_action :authorize_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    render "users/sessions/show"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Compte utilisateur créé avec succès."
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
      @reservations = current_user.reservations.includes(:experience)
      @experiences = @reservations.map(&:experience)
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      if current_user.admin?
        # Si c'est un admin, on redirige vers le profil de l'utilisateur
        redirect_to user_path(@user), notice: "Profil mis à jour."
      else
        # Si ce n'est pas un admin, on redirige vers le dashboard de l'utilisateur
        redirect_to user_dashboard_path, notice: "Profil mis à jour."
      end
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Compte supprimé."
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
    # L'admin doit pouvoir modifier son propre profil
    unless current_user.admin? || current_user == @user
      redirect_to root_path, alert: "Accès interdit."
    end
  end

  def authorize_admin!
    redirect_to root_path, alert: "Accès interdit." unless current_user.admin?
  end
end
