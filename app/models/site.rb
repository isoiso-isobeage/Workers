class Site < ApplicationRecord
  validates :name,presence:true
  validates :description,presence:true,length:{maximum:250}

  belongs_to :user

  # 現場ユーザー関係
  has_many :site_users, dependent: :destroy
  has_many :users, through: :site_users

  has_many :works

end
