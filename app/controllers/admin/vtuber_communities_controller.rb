class Admin::VtuberCommunitiesController < ApplicationController
  def index
    @vtuber_communities = VtuberCommunity.all
    @posts = Post.where(customer_id: Customer.where(is_deleted: false).ids).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @vtuber_communities = VtuberCommunity.all
    @vtuber_community = VtuberCommunity.find(params[:id])
    @posts = Post.where(customer_id: Customer.where(is_deleted: false).ids, vtuber_community_id: @vtuber_community).order(created_at: :desc).page(params[:page]).per(20)
  end

  def search
    @vtuber_communities = VtuberCommunity.all
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
                Post.where(['introduction LIKE ?', "%#{params[:search]}%"]).order(created_at: :desc).page(params[:page]).per(20)
             else
                Post.none.page(params[:page]).per(20)
             end
  end
end
