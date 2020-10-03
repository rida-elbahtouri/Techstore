class ProductsController < ApplicationController
    before_action :authenticate_user!
    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = current_user.goods.new(product_params)
        if @product.save
            flash[:notice] = "your product has been created succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't create the product"
            render new
        end 
    end

    private

    def product_params
        params.require(:product).permit(:name,:description,:price,:categ)
    end
end