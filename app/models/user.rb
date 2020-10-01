class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments,foreign_key: "customer_id"
  has_many :ratings,foreign_key: "customer_id"
  
  has_many :goods, class_name: "Product",foreign_key: 'seller_id'
  has_many :baskets,foreign_key: "customer_id"
  has_many :products, through: :baskets,foreign_key: "product_id"
end
