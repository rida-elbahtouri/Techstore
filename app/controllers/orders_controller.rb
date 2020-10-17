class OrdersController < ApplicationController
    before_action :authenticate_user!
    def index
        @orders = current_user.orders
    end

    def create
        user= User.find(current_user.id)
        user.baskets.each do |basket|
            pr=Product.find(basket.product_id)
            order=Order.new(seller_id:pr.seller_id,
            product_id:basket.product_id,
            quantity:basket.quantity,
            customer_id:current_user.id,
            adress:current_user.cus_detail.adress)    
            order.save    
        end
        user.baskets.delete_all
       redirect_to products_path
       
    end
end