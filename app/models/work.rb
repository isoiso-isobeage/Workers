class Work < ApplicationRecord

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_finish_check
  validate :start_check

  # 現場
  belongs_to :site
  # 人数
  has_many :personnels

  accepts_nested_attributes_for :personnels, allow_destroy: true

  def start_finish_check
    errors.add(:end_date, "は開始時刻より遅い時間を選択してください") if self.start_date > self.end_date
  end

  def start_check
    errors.add(:start_date, "は現在の日時より遅い時間を選択してください") if self.start_date < Time.now
  end
end
