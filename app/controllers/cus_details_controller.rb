class CusDetailsController < ApplicationController
  before_action :authenticate_user!
  def new
    @cus_details = CusDetail.new
  end

  def create
    cusdet = if current_user.cus_detail
               current_user.cus_detail.update(adress: params[:adress])
             else
               current_user.create_cus_detail(adress: params[:adress])
             end
    if cusdet
      flash[:notice] = 'your information has been added succesfully'
      redirect_to products_path
    else
      flash[:alert] = "we couldn't add your information"
      render :new
    end
  end

  private

  def cus
    params.require(:cus_detail).permit(:adress)
  end
end
