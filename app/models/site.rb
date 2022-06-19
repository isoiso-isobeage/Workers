class Site < ApplicationRecord
  validates :name, length: { minimum: 1, maximum: 30, message: "は1文字以上、30文字以内で入力してください" }
  validates :description,length:{maximum:250, message: "250文字以内で入力してください"}

  belongs_to :user



  # 現場ユーザー関係
  has_many :site_users, dependent: :destroy
  has_many :users, through: :site_users

  has_many :works

end
