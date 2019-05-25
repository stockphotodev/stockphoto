class ImagesController < ApplicationController
  before_action :set_image, only: [:show]
  before_action :set_similar_image, only: [:show]
  before_action :set_same_model_image, only: [:show]
  before_action :set_tag, only: [:show, :tag]
  before_action :authenticate_user!, except: [:show]
  

  def index
    @images = Image.where(image_category_id: params[:format].to_i)
  end

  def show

  end

  def tag
    @tag = ImageTag.find(params[:tag_id])
    @images = Image.where(id: ImageImageTag.where(image_tag_id: @tag.id).pluck(:image_id))
  end

  def download
    @image = Image.find(params[:image_id])
    filepath = @image.image.current_path
    data = open(@image.image.url)
    send_data(data.read, filename: @image.image_identifier, type: @image.image.content_type)
    user = current_user
    @limit = user.download_limit
    @limit.limit_of_image -= 1
    @limit.save
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def set_tag
    @tags = ImageTag.all
  end

  def set_similar_image
    @similar_image = Image.where(image_category_id: @image.image_category_id).where.not(id: @image.id)
  end

  def set_same_model_image
    @images_of_same_model = Image.where(image_model_id: @image.image_model_id).where.not(id: @image.id)
  end

end
