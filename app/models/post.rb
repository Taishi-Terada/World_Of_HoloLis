class Post < ApplicationRecord
  has_many_attached :image

  belongs_to :customer
  belongs_to :vtuber_community
  has_many :post_comments, dependent: :destroy
  has_many :post_bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy


  validates :introduction, presence: true

  def post_bookmarked_by?(customer)
    post_bookmarks.exists?(customer_id: customer.id)
  end
  
  def create_notification_bookmark!(current_customer)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_customer.id, customer_id, id, 'bookmark'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_customer.active_notifications.new(
        post_id: id,
        visited_id: customer_id,
        action: 'bookmark'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  def create_notification_comment!(current_customer, post_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = PostComment.select(:customer_id).where(post_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_customer, post_comment_id, temp_id['customer_id'])
    end
    # 投稿者に通知を送る
    save_notification_comment!(current_customer, post_comment_id, customer_id)
  end

  def save_notification_comment!(current_customer, post_comment_id, customer_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_customer.active_notifications.new(
      post_id: id,
      post_comment_id: post_comment_id,
      visited_id: customer_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


end
