# coding: utf-8
class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    keyword = params[:keyword].present? ? params[:keyword] : ""
        
    # TODO:runsackにしたい
    if keyword.blank?
      @images = Image.last(6)
      @illustrations = Illustration.last(6)
      @movies = Movie.last(6)
    else
      @images = Image.where("name LIKE ?", "%#{keyword}%").last(6)
      @illustrations = Illustration.where("name LIKE ?", "%#{keyword}%").last(6)
      @movies = Movie.where("name LIKE ?", "%#{keyword}%").last(6)
    end
  end

  def search
    keyword = params[:keyword].present? ? params[:keyword] : ""
    type = params[:type].present? ? params[:type] : ""

    case type
    when '画像' then
      @images = Image.where("name LIKE ?", "%#{keyword}%").last(6)
    when 'イラスト' then
      @illustrations = Illustration.where("name LIKE ?", "%#{keyword}%").last(6)
    when '動画' then
      @movies = Movie.where("name LIKE ?", "%#{keyword}%").last(6)
    end
  end
end
