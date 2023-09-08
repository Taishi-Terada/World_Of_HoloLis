class Admin::NewsController < ApplicationController
  def create
    @news = News.new(news_params)
    @news.save
    redirect_to admin_root_path(@news), notice: "投稿が完了しました"
  end

  def destroy
    news = News.find(params[:id])
    news.destroy
    redirect_to admin_root_path, notice: "投稿を削除しました"
  end

  private

  def news_params
    params.require(:news).permit(:image, :news_name, :news_introduction, :created_at, :updated_at)
  end
end