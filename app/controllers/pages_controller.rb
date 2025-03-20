class PagesController < ApplicationController
  def show
  end

  def home
    @experiences = Experience.all
    @trends = Experience.all
  end

  def about
  end

end
