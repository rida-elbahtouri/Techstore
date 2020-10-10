class Order < ApplicationRecord
    belongs_to :seller, class_name: "User"
    validates :product_id, presence: true
    validates :quantity, presence: true
    validates :customer_id , presence: true
    validates :adress , presence: true
end