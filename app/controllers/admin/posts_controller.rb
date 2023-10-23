class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new 
    @post_comments = @post.post_comments
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_back fallback_location: root_path, notice: "投稿を削除しました"
  end
end
