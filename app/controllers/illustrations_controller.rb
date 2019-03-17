class IllustrationsController < ApplicationController
  before_action :set_image, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def index
    illustration_ids = IllustrationCategory.where(category_id: params[:format].to_i).pluck(:illustration_id)
    @illustrations = Illustration.where(id: illustration_ids)
  end

  private

  def set_illustration
    @illustration = Illustration.find(params[:id])
  end
end
