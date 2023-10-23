class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @like_vtuber_communities = @customer.like_vtuber_communities
    @posts = @customer.posts.order(created_at: :desc).page(params[:page]).per(5)
  end

  def comment
    @customer = Customer.find(params[:id])
    @like_vtuber_communities = @customer.like_vtuber_communities
    @post_comments = @customer.post_comments.order(created_at: :desc).page(params[:page]).per(5)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to admin_customer_path(customer.id), notice: "user情報の更新に成功しました。"
    else
      render :edit and return
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:email, :name, :image, :introduction, :is_deleted)
  end

end

