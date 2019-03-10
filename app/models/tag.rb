class Tag < ApplicationRecord

  has_many :image_tags
  has_many :images, through: :image_tags

  has_many :illustration_tags
  has_many :illustrations, through: :illustration_tags

end
