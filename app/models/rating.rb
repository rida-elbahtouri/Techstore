class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :customer, class_name: 'User'
  validates :stars, presence: true, inclusion: { in: 1..5 }
end
