class BasketsController < ApplicationController
    before_action :authenticate_user!

    def index
        @basket = current_user.products
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
            flash[:alert] = "we couldn't add the product to your card" 
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
            redirect_to products_path
        else
            flash[:alert] = "we couldn't update the product"
            render edit
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
        params.require(:basket).permit(:product_id)
    end
end