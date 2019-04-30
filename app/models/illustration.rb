class Illustration < ApplicationRecord
  mount_uploader :illustration, IllustrationUploader

  has_many :illustration_tags, through: :illustration_illustration_tags
  has_many :illustration_illustration_tags
  
end
