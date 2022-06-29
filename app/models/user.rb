class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  validates :name, length: { minimum: 1, maximum: 15, message: "は1文字以上、15文字以内で入力してください" }
  validates :family_name, length: { minimum: 1, maximum: 15, message: "は1文字以上、15文字以内で入力してください" }
  validates :kana_name, length: { minimum: 1, maximum: 15, message: "は1文字以上、15文字以内で入力してください" }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "はカタカナで入力してください"}
  validates :kana_family_name, length: { minimum: 1, maximum: 15, message: "は1文字以上、15文字以内で入力してください" }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/,  message: "はカタカナで入力してください"}
  validates :phone_number, uniqueness: true, presence: true
  validates :company_name, presence: true

  # フォロー関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 自分が作った現場関係
  has_many :sites, dependent: :destroy

  # 参加している現場
  has_many :site_users, dependent: :destroy
  has_many :join_sites, through: :site_users, source: :site


  # 通知関連

  # 通知を送った
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  # 通知が送られた
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy



  # フォローする
  def follow(user)
    relationships.create(followed_id: user.id)
  end

  # フォロー外す
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォローしているか
  def following?(user)
    followings.include?(user)
  end

  # 相互フォロワーを返す
  def mutual_follow_users(user)
    mutual_follow_users = user.followings & user.followers
    return mutual_follow_users
  end


  # フォロー時の通知レコード作成
  def create_notification_follow(current_user, user)
    follow = Notification.where(visitor_id: current_user.id, visited_id: user.id, action: 0, checked: false)
    if follow.blank?
      notification = current_user.active_notifications.new(visitor_id: current_user.id, visited_id: user.id, action: 0)
      notification.save if notification.valid?
    end
  end


  # 現場ユーザー追加時の通知レコード作成
  def create_notification_site_user(current_user, user, site)
    site_user = Notification.where(visitor_id: current_user.id, visited_id: user.id, site_id: site.id, action: 1, checked: false)
    if site_user.blank?
      notification = current_user.active_notifications.new(visitor_id: current_user.id, visited_id: user.id, site_id: site.id, action: 1)
      notification.save if notification.valid?
    end
  end

  # 作業作成、更新時の通知レコード作成
  def create_notification_work(current_user, site_users, site, work)
    site_users.each do |user|
      notification = current_user.active_notifications.new(visitor_id: current_user.id, visited_id: user.id, site_id: site.id, work_id: work.id, action: 2)
      notification.save if notification.valid?
    end
  end


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def get_full_name(user)
    user.family_name + " " + user.name
  end


end
