class ProvidersController < ApplicationController
  before_action :set_provider, only: %i[show edit update destroy dashboard]
  
  def new
  @‌provider = Provider.new
  end
  
  def create
  @‌provider = Provider.new(provider_params)
  if @‌provider.save
  redirect_to root_path, notice: 'Compte prestataire créé avec succès.'
  else
  render :new
  end
  end
  
  def show
  end
  
  def dashboard
  @‌experiences = current_provider.experiences
  end
  
  def edit
  end
  
  def update
  if @‌provider.update(provider_params)
  redirect_to dashboard_path, notice: 'Profil mis à jour.'
  else
  render :edit
  end
  end
  
  def destroy
  @‌provider.destroy
  redirect_to root_path, notice: 'Compte supprimé.'
  end
  
  private
  def set_provider
  @‌provider = current_provider
  end
  
  def provider_params
  params.require(:provider).permit(:email, :password, :password_confirmation)
  end
  end