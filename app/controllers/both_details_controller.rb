class BothDetailsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    if current_user.sel_detail
      seldet = current_user.sel_detail.update(shipping_adress: params[:shipping_adress], product_type: params[:sel_detail]['product_type'])
    else
      seldet = current_user.create_sel_detail(shipping_adress: params[:shipping_adress], product_type: params[:sel_detail]['product_type'])
    end

    cusdet = if current_user.sel_detail
               current_user.cus_detail.update(adress: params[:adress])
             else
               current_user.create_cus_detail(adress: params[:adress])
             end

    if cusdet && seldet
      flash[:notice] = 'your information has been added succesfully'
      redirect_to products_path
    else
      flash[:alert] = "we couldn't add your information"
      render new
    end
  end
end
