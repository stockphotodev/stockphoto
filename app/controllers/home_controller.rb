class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_plans

  def index
    @images = Image.last(6)
    @illustrations = Illustration.last(6)
    @movies = Movie.last(6)
  end

  private

  def set_plans
    @plans = Plan.all
  end
end
