class UserdetailsController < ApplicationController
    before_action :authenticate_user!


    def new_both
    end
    def new_customer
    end
    def new_seller
    end
    
    def both
        if current_user.create_cus_detail(cus) && current_user.create_sel_detail(sel)
            flash[:notice] = "your information has been added succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't add ypur information"
            render new_both
        end   
    end
    def customer
        if @cus_details = current_user.create_cus_detail(cus)
            flash[:notice] = "your information has been added succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't add ypur information"
            render new_customer
        end
        
    end
    def seller
        if @sel_details = current_user.create_sel_detail(sel)   
            flash[:notice] = "your information has been added succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't add ypur information"
            render new_seller
        end
    end
    private
    def cus
        params.require(:details).permit(:adress)
    end
    def sel
        params.require(:details).permit(:shipping_adress,:product_type)
    end
end