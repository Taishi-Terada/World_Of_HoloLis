class VtuberCommunity < ApplicationRecord
  has_one_attached :image
  
  belongs_to :vtuber_information
  has_many :like_vtuber_communities, dependent: :destroy
  
  def liked_by?(customer)
    like_vtuber_communities.exists?(customer_id: customer.id)
  end
  
end
