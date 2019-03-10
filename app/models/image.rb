class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :image_categories
  has_many :categories, through: :image_categories

  has_many :image_tags
  has_many :tags, through: :image_tags

end
