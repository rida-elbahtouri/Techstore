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
    scope :mosts ,-> {Product.order("selletimes DESC").limit(5)}
    scope :hurryup, -> {Product.order("promotion DESC").limit(4)}

    def avg
        (self.ratings.average(:stars)).to_f
    end
    
    def ratingsstatic
        one  = ratings.where(stars:1).count
        two  = ratings.where(stars:2).count
        three  = ratings.where(stars:3).count
        four  = ratings.where(stars:4).count
        five  = ratings.where(stars:5).count

        return {one: one,       
            two:  two, 
            three:  three  , 
            four:    four,   
            five:  five }
    end

end