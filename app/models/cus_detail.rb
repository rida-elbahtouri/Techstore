class CusDetail < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  validates :adress, presence: true
end
