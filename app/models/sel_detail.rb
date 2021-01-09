class SelDetail < ApplicationRecord
  belongs_to :seller, class_name: 'User'

  validates :shipping_adress, presence: true
  validates :product_type, presence: true
end
