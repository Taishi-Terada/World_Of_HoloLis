class VtuberInformation < ApplicationRecord
  has_one_attached :image

  has_one :vtuber_community, dependent: :destroy

  validates :vtuber_name, presence:true
  validates :youtube_name, presence:true
  validates :twitter_name, presence:true
  validates :tag_name, presence:true
  validates :fan_name, presence:true
  validates :mark, presence:true
  validates :color, presence:true
  validates :height, presence:true
  validates :blood_type, presence:true
  validates :birthday, presence:true
  validates :first_delivery, presence:true

end
