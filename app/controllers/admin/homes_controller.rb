class Admin::HomesController < ApplicationController
  def top
    @vtuber_informations = VtuberInformation.all
    @new_news = News.new
    @news = News.all.page(params[:page]).per(8)
  end
end
