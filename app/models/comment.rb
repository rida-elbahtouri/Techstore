class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :customer, class_name: 'User'

  validates :content, presence: true, length: { minimum: 20, maximum: 500 }
end
