class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def index
    image_ids = ImageCategory.where(category_id: params[:format].to_i).pluck(:image_id)
    @images = Image.where(id: image_ids)
  end

  def show

  end

  private

  def set_image
    @image = Image.find(params[:id])
  end
end
