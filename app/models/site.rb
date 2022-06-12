class Site < ApplicationRecord
  validates :name,presence:true
  validates :description,presence:true,length:{maximum:200}

  belongs_to :user

  # 現場ユーザー関係
  has_many :site_users
  has_many :users, through: :site_users

  # 現場に参加しているか
  # def join_user?(mutual_follow_users, site_users)
  #   mutual_follow_users.each do |user|
  #     # byebug
  #     users = site_users.where.not(id: user.id)
  #     return users
  #   end
  # end

end
