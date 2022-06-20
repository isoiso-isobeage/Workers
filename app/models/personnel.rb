class Personnel < ApplicationRecord

  # 0は保存しない
  validates :count, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  belongs_to :work
end
