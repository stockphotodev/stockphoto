# coding: utf-8
class Admin::ImagesController < ApplicationController

  def index
    @image = Image.new
  end

  def create
    @image = Image.new
    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(ENV.fetch('AWS_S3_BUCKET'))

    image = image_params[:image]
    image_name = image.original_filename
    s3_path = "uploads/#{image_name}"
    object = bucket.object(s3_path)
    object.put(body: image)
    @image.image = image_name
    if @image.save
      redirect_to admin_images_path, notice: 'imageが追加されました'
    end
  end

  private

  def image_params
    params[:image].permit(
      :image
    )
  end
end
