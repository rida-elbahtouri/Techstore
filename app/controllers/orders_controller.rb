class OrdersController < ApplicationController
    before_action :authenticate_user!
    def new
        @cus_details = Order.new
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
       redirect_to products_path
       
    end

    private

    # def order_params
    #     # params.require(:order).permit(:seller_id,:product_id,:quantity,:customer_id,:adress)
    #     params.require(:order).permit(:customer_id)
    # end
end