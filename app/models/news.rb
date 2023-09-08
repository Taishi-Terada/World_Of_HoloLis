class News < ApplicationRecord
  has_one_attached :image
  
  validates :news_name, presence:true
  validates :news_introduction, presence:true
end
