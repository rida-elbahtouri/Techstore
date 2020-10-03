class Rating < ApplicationRecord
    belongs_to :product
    belongs_to :customer, class_name: "User"
    validates :stars,length: {minimum:1, maximum:5}
  end
  