class Product < ApplicationRecord
    belongs_to :seller ,class_name:"User"

    has_many :baskets
    has_many :customers, through: :baskets,foreign_key: "customer_id"
end