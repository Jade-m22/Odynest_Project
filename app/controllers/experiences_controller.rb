class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show edit update destroy]
  before_action :authorize_provider_or_admin!, only: %i[new create edit update destroy]

  # Affiche toutes les expériences
  def index
    @experiences = Experience.all

    case params[:sort]
    when "newest"
        @experiences = @experiences.order(created_at: :desc)
    when "oldest"
        @experiences = @experiences.order(created_at: :asc)
    when "price_asc"
        @experiences = @experiences.order(price: :asc)
    when "price_desc"
        @experiences = @experiences.order(price: :desc)
    when "city_asc"
        @experiences = @experiences.order(location: :asc)
    when "city_desc"
        @experiences = @experiences.order(location: :desc)
    end
  end

  # Affiche une seule expérience
  def show
    # Pas besoin de redéfinir @experience ici, il est déjà défini par set_experience
  end

  # Formulaire pour créer une nouvelle expérience
  def new
    @experience = Experience.new
  end

  # Crée une nouvelle expérience
  def create
    @experience = Experience.new(experience_params)
    @experience.provider_id = current_provider.id
    if @experience.save
      redirect_to @experience, notice: "Expérience créée avec succès."
    else
      render :new
    end
  end

  # Formulaire pour modifier une expérience existante
  def edit
  end

  # Met à jour une expérience existante
  def update
    if @experience.update(experience_params)
      redirect_to @experience, notice: "Expérience mise à jour avec succès."
    else
      render :edit
    end
  end

  # Supprime une expérience
  def destroy
    if @experience.reservations.exists?
      redirect_to @experience, alert: "Impossible de supprimer une expérience avec des réservations en cours."
    else
      @experience.destroy
      redirect_to experiences_path, notice: "Expérience supprimée avec succès."
    end
  end


  private

  # Définit l'expérience à modifier ou afficher
  def set_experience
    @experience = Experience.find(params[:id])
  end

  # Permet de sécuriser les paramètres de l'expérience
  def experience_params
    params.require(:experience).permit(:title, :description, :price, :location, :duration, :start_date_1, :start_date_2, :start_date_3, :photo)
  end

  # Vérifie si l'utilisateur actuel est un admin ou un provider
  def authorize_provider_or_admin!
    unless current_user&.admin? || current_provider.present?
      redirect_to root_path, alert: "Accès non autorisé."
    end
  end
end
