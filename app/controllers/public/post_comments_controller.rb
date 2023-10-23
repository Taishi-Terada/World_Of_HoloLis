class Public::PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    post_comment = current_customer.post_comments.new(post_comment_params)
    post_comment.post_id = @post.id
    post_comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back fallback_location: root_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
