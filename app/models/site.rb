class Site < ApplicationRecord
  validates :name,presence:true
  validates :description,presence:true,length:{maximum:200}
end
