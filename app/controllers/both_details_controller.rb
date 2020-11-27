class BothDetailsController < ApplicationController
    before_action :authenticate_user!

    def new
    end

    def create
        seldet = current_user.create_sel_detail(shipping_adress: params[:shipping_adress],product_type: params[:sel_detail]["product_type"])
        cusdet = current_user.create_cus_detail( adress: params[:adress])
        
        if cusdet && seldet
            flash[:notice] = "your information has been added succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't add your information"
            render new
        end   
    end

end
   