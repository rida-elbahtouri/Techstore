class Product < ApplicationRecord
    belongs_to :seller ,class_name:"User"

    has_many :comments
    has_many :ratings

    has_many :baskets
    has_many :customers, through: :baskets,foreign_key: "customer_id"

    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :price , presence: true
    validates :type , presence: true
    def avg
        (self.ratings.average(:stars)).to_f
    end
end