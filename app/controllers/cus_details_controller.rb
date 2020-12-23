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

  def edit
    @cus_details = CusDetail.find(params[:id])
  end

  def update
    if @cus_details = current_user.update_cus_detail(cus)
      flash[:notice] = 'your information has been updated succesfully'
      redirect_to products_path
    else
      flash[:alert] = "we couldn't update your information"
      render edit
    end
  end

  def destroy
    if @cus_details = current_user.cus_detail.destroy
      redirect_to products_path
    else
      flash[:alert] = "we couldn't update your information"
      render show
    end
  end

  private

  def cus
    params.require(:cus_detail).permit(:adress)
  end
end
