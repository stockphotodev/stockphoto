class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]
  before_action :set_tag, only: [:show, :tag]
  before_action :authenticate_user!, except: [:show]

  def index
    movie_ids = MovieCategory.where(category_id: params[:format].to_i).pluck(:movie_id)
    @movies = Movie.where(id: movie_ids)
  end

  def show

  end

  def tag
    @tag = MovieTag.find(params[:tag_id])
    @movies = Movie.where(id: MovieMovieTag.where(movie_tag_id: @tag.id).pluck(:movie_id))
  end

  def download
    @movie = Movie.find(params[:movie_id])
    filepath = @movie.movie.current_path
    data = open(@movie.movie.url)
    send_data(data.read, filename: @movie.movie_identifier, type: @movie.movie.content_type)
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_tag
    @tags = MovieTag.all
  end
end
