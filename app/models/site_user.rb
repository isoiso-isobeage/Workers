class SiteUser < ApplicationRecord
  belongs_to :users
  belongs_to :sites
end
