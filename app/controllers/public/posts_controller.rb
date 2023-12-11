class Public::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new 
    @post_comments = @post.post_comments
  end
    
  def create
    @post = Post.new(post_params)
    if @post.image.size<=2
      @post.customer_id = current_customer.id
      if @post.save
        redirect_back fallback_location: root_path, notice: "投稿が完了しました"
      else
        redirect_back fallback_location: root_path, notice: @post.errors.full_messages.join(" ")
      end
    else
      redirect_back fallback_location: root_path, alert: "投稿できる画像数は2枚まで"
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_customer), notice: "投稿を削除しました"
  end
  
  private

  def post_params
    params.require(:post).permit(:customer_id, :vtuber_community_id, :introduction, :category, image: [])
  end
end
