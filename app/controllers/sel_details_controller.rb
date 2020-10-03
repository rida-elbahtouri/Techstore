class SelDetailsController < ApplicationController
    before_action :authenticate_user!
    def new
        @sel_details = SelDetail.new
    end

    def create
        if @sel_details = current_user.create_sel_detail(sel)
            flash[:notice] = "your information has been added succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't add ypur information"
            render new
        end
    end

    def edit
        @sel_details = SelDetail.find(params[:id])
    end

    def update
        if @sel_details = current_user.update_sel_detail(sel)
            flash[:notice] = "your information has been updated succesfully"
            redirect_to products_path
        else
            flash[:alert] = "we couldn't update your information"
            render edit
        end
    end

    def destroy
        if @sel_details = current_user.sel_detail.destroy
            redirect_to products_path
        else
            flash[:alert] = "we couldn't update your information"
            render show
        end
    end
  

    private

    def sel
        params.require(:sel_detail).permit(:shipping_adress,:product_type)
    end
end