# coding: utf-8
class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @images = Image.last(6).reverse
    @illustrations = Illustration.last(6).reverse
    @movies = Movie.last(6).reverse
  end

  def search
    keyword = params[:keyword].present? ? params[:keyword] : ""
    type = params[:type].present? ? params[:type] : ""

    case type
    when '画像' then
      @images = Image.where("name LIKE ?", "%#{keyword}%").last(6).reverse
    when 'イラスト' then
      @illustrations = Illustration.where("name LIKE ?", "%#{keyword}%").last(6).reverse
    when '動画' then
      @movies = Movie.where("name LIKE ?", "%#{keyword}%").last(6).reverse
    end
  end
end
