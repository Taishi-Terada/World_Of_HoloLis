class Public::LikeVtuberCommunitiesController < ApplicationController
  def create
    @like_vtuber_community = LikeVtuberCommunity.create(vtuber_community_id: params[:vtuber_community_id],customer_id: current_customer.id)
    @vtuber_community = VtuberCommunity.find(params[:vtuber_community_id].to_i)
  end

  def destroy
    @like_vtuber_community = LikeVtuberCommunity.find_by(vtuber_community_id: params[:vtuber_community_id],customer_id: current_customer.id)
    @vtuber_community = VtuberCommunity.find(params[:vtuber_community_id].to_i)
    @like_vtuber_community.destroy
  end
  
  private

  def like_vtuber_community_params
      params.require(:like_vtuber_community).permit(:customer_id, :vtuber_community_id)
  end
end
