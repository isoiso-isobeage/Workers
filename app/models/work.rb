class Work < ApplicationRecord

  validates :name, presence: true, length: { minimum: 1, maximum: 15, message: "は1文字以上、15文字以内で入力してください" }
  validates :content, length: {maximum: 300, message: "15文字以内で入力してください" }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_finish_check
  validate :start_check

  # 現場
  belongs_to :site
  # 人数
  has_many :personnels, dependent: :destroy

  accepts_nested_attributes_for :personnels, allow_destroy: true

  def start_finish_check
    errors.add(:end_date, "は開始時刻より遅い時間を選択してください") if self.start_date > self.end_date
  end

  def start_check
    errors.add(:start_date, "は現在の日時より遅い時間を選択してください") if self.start_date < Time.now
  end
end
