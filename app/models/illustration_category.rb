class IllustrationCategory < ApplicationRecord
  belongs_to :illustration
  belongs_to :category
end
