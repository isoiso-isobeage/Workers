class Site < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 30, message: "は2文字以上、30文字以内で入力してください" }
  validates :description,length:{maximum:250, message: "250文字以内で入力してください"}

  belongs_to :user



  # 現場ユーザー関係
  has_many :site_users, dependent: :destroy
  has_many :users, through: :site_users

  has_many :works, dependent: :destroy

  # 通知機能
  has_many :notifications, dependent: :destroy

end
