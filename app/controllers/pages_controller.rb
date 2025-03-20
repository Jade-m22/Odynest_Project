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
end
