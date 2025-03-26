class PagesController < ApplicationController
  def show
  end

  def home
    @trends = Experience.order("RANDOM()").limit(3)
    if provider_signed_in?
      @experiences = current_provider.experiences
    else
      @experiences = Experience.all
    end
  end

  def about
  end

  def contact
  end

  def legal_mentions
  end

  def terms
  end

  def toggle_font
    session[:dyslexic_font] = !session[:dyslexic_font]
    redirect_back fallback_location: root_path, notice: "Préférence de police mise à jour"
  end  

  def set_daltonism
    session[:daltonism_mode] = params[:mode]
    redirect_back fallback_location: root_path, notice: "Mode de couleur mis à jour"
  end  
end
