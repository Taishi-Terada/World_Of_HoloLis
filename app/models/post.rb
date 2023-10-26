class Post < ApplicationRecord
  has_many_attached :image

  belongs_to :customer
  belongs_to :vtuber_community
  has_many :post_comments, dependent: :destroy
  has_many :post_bookmarks, dependent: :destroy

  validates :introduction, presence: true

  def post_bookmarked_by?(customer)
    post_bookmarks.exists?(customer_id: customer.id)
  end
end
