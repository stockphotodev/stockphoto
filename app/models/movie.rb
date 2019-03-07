class Movie < ApplicationRecord
  mount_uploader :movie, MovieUploader
end
