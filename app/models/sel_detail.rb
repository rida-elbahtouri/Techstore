class SelDetail < ApplicationRecord
    belongs_to :seller ,class_name:"User"
end