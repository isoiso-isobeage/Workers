class SiteUser < ApplicationRecord
  belongs_to :user
  belongs_to :site

  # 通知機能
  has_many :notifications, dependent: :destroy


end
