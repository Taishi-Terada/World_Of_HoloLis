class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
    @like_vtuber_communities = @customer.like_vtuber_communities
    @posts = @customer.posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @customer = Customer.find(params[:id])
    @vtuber_communities = VtuberCommunity.all
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to user_path(current_customer), notice: "user情報の更新に成功しました。"
    else
      render :edit and return
    end
  end

  def quit
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  def post_bookmarks
    @customer = Customer.find(params[:id])
    @like_vtuber_communities = @customer.like_vtuber_communities
    post_bookmarks= PostBookmark.where(customer_id: @customer.id).where(customer_id: Customer.where(is_deleted: false).ids).order(created_at: :desc).pluck(:post_id)
    @post_bookmark_posts = Post.find(post_bookmarks)
  end
  
  def post_comments
    @customer = Customer.find(params[:id])
    @like_vtuber_communities = @customer.like_vtuber_communities
    @post_comments = @customer.post_comments.where(customer_id: Customer.where(is_deleted: false).ids).order(created_at: :desc).page(params[:page]).per(10)
  end
  
  private

  def customer_params
    params.require(:customer).permit(:email, :name, :image, :introduction, :is_deleted)
  end

end
