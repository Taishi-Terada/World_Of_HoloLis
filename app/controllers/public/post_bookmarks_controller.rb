class Public::PostBookmarksController < ApplicationController
  def index

  end

  def create
    @post = Post.find(params[:post_id])
    post_bookmark = current_customer.post_bookmarks.new(post_id: @post.id)
    post_bookmark.save
    @post.create_notification_bookmark!(current_customer)
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_bookmark = current_customer.post_bookmarks.find_by(post_id: @post.id)
    post_bookmark.destroy
  end
end
