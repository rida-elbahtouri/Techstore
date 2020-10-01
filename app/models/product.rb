class Product < ApplicationRecord
    belongs_to :seller ,class_name:"User"

    has_many :comments
    has_many :ratings

    has_many :baskets
    has_many :customers, through: :baskets,foreign_key: "customer_id"



    def avg
        (self.ratings.average(:stars)).to_f
    end
end