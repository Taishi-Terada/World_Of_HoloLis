class Admin::HomesController < ApplicationController
  def top
    @vtuber_communities = VtuberCommunity.all
    @new_news = News.new
    @news = News.all.order(created_at: :desc).page(params[:page]).per(8)
  end
end
