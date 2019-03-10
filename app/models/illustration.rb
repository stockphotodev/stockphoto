class Illustration < ApplicationRecord
  mount_uploader :illustration, IllustrationUploader

  has_many :illustration_categories
  has_many :categories, through: :illustration_categories

  has_many :illustration_tags
  has_many :tags, through: :illustration_tags
  
end
