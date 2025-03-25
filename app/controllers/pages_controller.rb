class PagesController < ApplicationController
  def show
  end

  def home
    @experiences = Experience.all
    @trends = Experience.order("RANDOM()").limit(3)
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
end
