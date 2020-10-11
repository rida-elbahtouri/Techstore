class BasketsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_authenticity_token
    def index
        @baskets = current_user.baskets
        @sum = 0
        @baskets.each do |b|
            @sum += (b.quantity * b.product.price)
        end
    end

    def new
        @basket = current_user.baskets.new
    end

    def create
        @basket = current_user.baskets.new(product_params)
        if @basket.save
            flash[:notice] = "your product has been added to card"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't add the product to your card #{@basket.errors.full_messages}" 
            redirect_to products_path
        end 
    end

    def edit
        @basket = current_user.baskets.find(params[:id])
    end

    def update
        @basket = current_user.baskets.find(params[:id])
        if @basket.update(product_params)
            flash[:notice] = "your product has been updated succesfully"
            redirect_to baskets_path
        else
            flash[:alert] = "we couldn't update the product"
            render index
        end
    end

    def destroy
        @basket = current_user.baskets.find(params[:id])
        if @basket.destroy
            flash[:notice] = "your product has been removed succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't remove the product"
            render index
        end
    end
  

    private

    def product_params
        params.require(:basket).permit(:product_id,:quantity)
    end
end