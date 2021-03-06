class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update new create destory]
  before_action :user_is_seller!, only: %i[edit update new create destory]
  def index
    @mostselles = Product.all.mosts.first
    @hotselles = Product.all.mosts
    @hurryup = Product.all.hurryup
    @products = Product.all.limit(5)
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments.includes(:customer)
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.goods.new(product_params)
    if @product.save
      flash[:notice] = 'your product has been created succesfully'
      redirect_to product_path(@product.id)
    else
      flash[:alert] = "we couldn't create the product"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = current_user.goods.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'your product has been updated succesfully'
      redirect_to product_path(@product.id)
    else
      flash[:alert] = "we couldn't update the product"
      render :edit
    end
  end

  def destroy
    @product = current_user.goods.find(params[:id])
    if @product.destroy
      flash[:notice] = 'your product has been removed succesfully'
      redirect_to user_path
    else
      flash[:alert] = "we couldn't remove the product"
      render :index
    end
  end

  def category
    @products = Product.all.where(categ: params[:cat]).order('selletimes DESC').limit(10)
  end

  def search
    @products = Product.all.searsh("%#{params[:term]}%")
  end

  def productdata
    product = Product.find(params[:id])
    render json: product
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :categ, :photo, :promotion, :content)
  end

  def user_is_seller!
    redirect_to edit_user_registration_path(current_user.id) if !current_user.sel_detail && !current_user.cus_detail
  end
end
