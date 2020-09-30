class Basket < ApplicationRecord
    belongs_to :customer,class_name: "User"
    belongs_to :product
end