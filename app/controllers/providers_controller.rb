class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show edit update destroy dashboard]

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      redirect_to provider_dashboard_path, notice: "Compte prestataire cr\u00E9\u00E9 avec succ\u00E8s."
    else
      render :new
    end
  end

  def show
  end

  def dashboard
    @experiences = current_provider.experiences.includes(:users)
  end

  def edit
  end

  def update
    if @provider.update(provider_params)
      redirect_to dashboard_path, notice: "Profil mis \u00E0 jour."
    else
      render :edit
    end
  end

  def destroy
    @provider.destroy
    redirect_to root_path, notice: "Compte supprim\u00E9."
  end

  private

  def set_provider
    @provider = current_provider
  end

  def provider_params
    params.require(:provider).permit(:email, :password, :password_confirmation, :profile_picture, :first_name)
  end
end
