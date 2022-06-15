class Work < ApplicationRecord

  belongs_to :site

  has_many :personnels
end
