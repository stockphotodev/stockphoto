class Movie < ApplicationRecord
  mount_uploader :movie, MovieUploader

  has_many :movie_movie_tags
  has_many :movie_tags, through: :movie_movie_tags

end
