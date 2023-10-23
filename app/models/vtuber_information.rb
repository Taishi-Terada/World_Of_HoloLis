class VtuberInformation < ApplicationRecord
  has_one_attached :image

  has_one :vtuber_community, dependent: :destroy

end
