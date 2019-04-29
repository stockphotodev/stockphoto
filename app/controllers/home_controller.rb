class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @images = Image.last(6)
    @illustrations = Illustration.last(6)
    @movies = Movie.last(6)
  end

end
