class Notification < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :site, optional: true
  belongs_to :work, optional: true
  belongs_to :site_user, optional: true
  # 送った通知
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  # 送られた通知
	belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true


  enum action: { follow: 0, site_user: 1, create_work: 2, update_work: 3, cancel_work: 4 }


end
