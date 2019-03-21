class IllustrationsController < ApplicationController
  before_action :set_illustration, only: [:show]
  before_action :authenticate_user!, except: [:show]

  def index
    illustration_ids = IllustrationCategory.where(category_id: params[:format].to_i).pluck(:illustration_id)
    @illustrations = Illustration.where(id: illustration_ids)
  end

  def download
    @illustration = Illustration.find(params[:illustration_id])
    filepath = @illustration.illustration.current_path
    data = open(@illustration.illustration.url)
    send_data(data.read, filename: @illustration.illustration_identifier, type: @illustration.illustration.content_type)
  end

  private

  def set_illustration
    @illustration = Illustration.find(params[:id])
  end
end
