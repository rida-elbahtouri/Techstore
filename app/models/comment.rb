class Comment < ApplicationRecord
    belongs_to :product
    belongs_to :customer, class_name: "User"
end
  