class Movie < ApplicationRecord
  mount_uploader :movie, MovieUploader

  has_many :movie_categories
  has_many :categories, through: :movie_categories

  has_many :movie_tags
  has_many :tags, through: :movie_tags

end
