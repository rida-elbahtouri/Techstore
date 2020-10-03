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

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = current_user.goods.find(params[:id])
        if @product.update(product_params)
            flash[:notice] = "your product has been updated succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't update the product"
            render edit
        end
    end

  

    private

    def product_params
        params.require(:product).permit(:name,:description,:price,:categ)
    end
end