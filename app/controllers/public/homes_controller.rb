class Public::HomesController < ApplicationController
  def top
    @vtuber_communities = VtuberCommunity.all
    @news = News.all.order(created_at: :desc).page(params[:page]).per(8)
  end

  def about
  end
end
