class PagesController < ApplicationController
  def show
  end

  def home
    @experiences = Experience.all
  en

end
