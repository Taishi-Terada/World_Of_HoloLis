class Public::HomesController < ApplicationController
  def top
    @vtuber_informations = VtuberInformation.all
    @news = News.all.page(params[:page]).per(8)
  end

  def about
  end
end
