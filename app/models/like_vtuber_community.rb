class LikeVtuberCommunity < ApplicationRecord
  has_one_attached :image
  
  belongs_to :customer
  belongs_to :vtuber_community
  
  validates :customer_id, presence: true
  validates :vtuber_community_id, presence: true
  validates_uniqueness_of :vtuber_community_id, scope: :customer_id

  def self.like_method(vtuber_community, customer)
    Like.find_by(vtuber_community_id: vtuber_community.id, customer_id: customer.id)
  end
end
