class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    stars = params[:stars][-1].to_i
    rating = current_user.ratings.new(product_id: params[:product_id], stars: stars)
    if rating.save
      flash[:notice] = 'your review  has been created succesfully'
      redirect_to products_path
    else
      flash[:alert] = "we couldn't add your rating"
      render :new
    end
  end

  def update
    stars = params[:stars][-1].to_i
    oldRating = current_user.ratings.find(params[:id])
    oldRating.stars = stars
    if oldRating.save
      flash[:notice] = 'your review  has been updated succesfully'
      redirect_to products_path
    else
      flash[:alert] = "we couldn't update your rating"
      render :new
    end
  end
end
