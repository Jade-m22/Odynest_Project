class ExperiencesController < ApplicationController
    before_action :set_experience, only: %i[show edit update destroy]
    before_action :authorize_provider_or_admin!, only: %i[new create edit update destroy]
  
    def index
      @experiences = Experience.all
    end
  
    def show
        @experience = Experience.find(params[:id])
    end
  
    def new
      @experience = current_provider.experiences.build
    end
  
    def create
      @experience = current_provider.experiences.build(experience_params)
      if @experience.save
        redirect_to @experience, notice: 'Expérience créée avec succès.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @experience.update(experience_params)
        redirect_to @experience, notice: 'Expérience mise à jour avec succès.'
      else
        render :edit
      end
    end
  
    def destroy
      if @experience.reservations.empty?
        @experience.destroy
        redirect_to experiences_path, notice: 'Expérience supprimée.'
      else
        redirect_to @experience, alert: 'Impossible de supprimer une expérience avec des réservations.'
      end
    end
  
    private
  
    def set_experience
      @experience = Experience.find(params[:id])
    end
  
    def experience_params
      params.require(:experience).permit(:title, :description, :price, :location, :duration, :provider_id)
    end
  
    def authorize_provider_or_admin!
      redirect_to root_path unless current_admin? || current_provider
    end
  end
  