class Movie < ApplicationRecord
  mount_uploader :movie, MovieUploader

  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories

  has_many :movie_tags, dependent: :destroy
  has_many :tags, through: :movie_tags

end
