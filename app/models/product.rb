class Product < ApplicationRecord
    belongs_to :seller ,class_name:"User"

    has_many :comments , dependent: :destroy
    has_many :ratings , dependent: :destroy

    has_many :baskets, dependent: :destroy
    has_many :customers, through: :baskets,foreign_key: "customer_id", dependent: :destroy

    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :price , presence: true
    validates :categ , presence: true
    scope :mosts ,-> {Product.order("selletimes DESC").first}
    def avg
        (self.ratings.average(:stars)).to_f
    end

end