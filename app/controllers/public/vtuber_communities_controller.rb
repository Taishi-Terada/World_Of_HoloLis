class Public::VtuberCommunitiesController < ApplicationController
  before_action :move_to_signed_in, except: []
  def index
    @vtuber_communities = VtuberCommunity.all
    @posts = Post.where(customer_id: Customer.where(is_deleted: false).ids).order(created_at: :desc).page(params[:page]).per(20)
    @post = Post.new
  end

  def show
    @vtuber_communities = VtuberCommunity.all
    @vtuber_community = VtuberCommunity.find(params[:id])
    @posts = Post.where(customer_id: Customer.where(is_deleted: false).ids, vtuber_community_id: @vtuber_community).order(created_at: :desc).page(params[:page]).per(20)
    @post = Post.new
  end

  def search
    @vtuber_communities = VtuberCommunity.all
    @post = Post.new
    @section_title = "「#{params[:search]}」の検索結果"
    @posts = if params[:search].present?
                Post.includes(:customer).where('posts.introduction LIKE ?', "%#{params[:search]}%").where(customer: { is_deleted: false }).order(created_at: :desc).page(params[:page]).per(20)
             else
                Post.none.page(params[:page]).per(20)
             end
  end

  def tagsearch
    @vtuber_communities = VtuberCommunity.all
    @post = Post.new
    @section_title = "「#{params[:content]}」の検索結果"
    @posts = if params[:content].present?
                Post.includes(:customer).where('posts.category LIKE ?', "%#{params[:content]}%").where(customer: { is_deleted: false }).order(created_at: :desc).page(params[:page]).per(20)
             else
                Post.none.page(params[:page]).per(20)
             end
  end

  private

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to  '/customers/sign_in'
    end
  end

end
