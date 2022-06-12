class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  # フォロー関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 現場関係
  has_many :sites, dependent: :destroy
  has_many :join_sites, through: :site_users


  # フォローする
  def follow(user_id)
    relationships.create(followed_id: user_id)
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

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def get_full_name(user)
    user.family_name + " " + user.name
  end

end
