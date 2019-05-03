class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :image_image_tags
  has_many :image_tags, through: :image_image_tags

  belongs_to :image_category

end
