class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def index
    movie_ids = MovieCategory.where(category_id: params[:format].to_i).pluck(:movie_id)
    @movies = Movie.where(id: movie_ids)
  end

  def show

  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
