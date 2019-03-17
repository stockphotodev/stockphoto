class Illustration < ApplicationRecord
  mount_uploader :illustration, IllustrationUploader

  has_many :illustration_categories, dependent: :destroy
  has_many :categories, through: :illustration_categories

  has_many :illustration_tags, dependent: :destroy
  has_many :tags, through: :illustration_tags
  
end
