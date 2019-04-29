class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def index
    image_ids = ImageCategory.where(category_id: params[:format].to_i).pluck(:image_id)
    @images = Image.where(id: image_ids)
  end

  def show

  end

  def tag

  end

  def download
    @image = Image.find(params[:image_id])
    filepath = @image.image.current_path
    data = open(@image.image.url)
    send_data(data.read, filename: @image.image_identifier, type: @image.image.content_type)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end
end
