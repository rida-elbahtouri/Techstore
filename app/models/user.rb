class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments,foreign_key: "customer_id"
  has_many :ratings,foreign_key: "customer_id"
  
  has_many :goods, class_name: "Product",foreign_key: 'seller_id'
  has_many :baskets,foreign_key: "customer_id"
  has_many :orders ,foreign_key:"seller_id"
  has_many :products, through: :baskets,foreign_key: "product_id"

  has_one :sel_detail,foreign_key: 'seller_id'
  has_one :cus_detail,foreign_key: "customer_id"

  def static
    if service == "Both"
      numberofproducts =  goods.count
      selles = goods.sum(:selletimes)

      return {nproducts: numberofproducts, selles:selles}
    end
  end
end
