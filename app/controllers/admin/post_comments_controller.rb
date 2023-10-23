class Admin::PostCommentsController < ApplicationController
  def index
    @post_comments = PostComment.where(customer_id: Customer.where(is_deleted: false).ids).order(created_at: :desc).page(params[:page]).per(30)
  end
  
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_back fallback_location: root_path
  end
end
