class Site < ApplicationRecord
  validates :name,presence:true
  validates :description,presence:true,length:{maximum:200}

  belongs_to :user

  # 現場ユーザー関係
  has_many :site_users
  has_many :users, through: :site_users

  # 現場に参加しているか
  def user?(users)
    users.each do |user|
      !users.include?(user)
    end
  end
end
