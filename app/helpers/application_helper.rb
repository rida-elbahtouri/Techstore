module ApplicationHelper
  def image(product)
    if product.photo
      image_tag(product.photo, class: 'img')
    else
      content_tag(:div, 'No photo')
    end
  end

  def promotion(product)
    if product.promotion != 0
      @newprice = product.price - (product.price * product.promotion) / 100
      @prod = product
      render 'products/price'
    else
      content_tag(:span, "#{product.price} $")
    end
  end

  def addorgotobasket(product)
    @product = product
    basketproducts = current_user.baskets.pluck(:product_id)

    if basketproducts.include?(product.id)
      link_to 'See Basket', baskets_path, class: 'visit-basket'
    else
      render 'products/addtocardbutton'
    end
  end

  def results(products)
    @products = products
    render 'products/results'
  end

  def sellerprofile(user)
    render 'users/seller' if user.service == 'Both'
  end

  def getperc(num, tot)
    per = if tot != 0
            (num * 100) / tot
          else
            0
          end
    per
  end

  def colored(stars, avg)
    'coloredstar' if stars <= avg
  end

  def showRatingbtn(product)
    # condition to show rate btn
    if Order.find_by(customer_id: current_user.id, product_id: product.id)
      rating = current_user.ratings.find_by(product_id: product.id)
      if rating
        content_tag(:button, 'Update your Rating', class: 'rate_btn', id: 'rate_product')
      else
        content_tag(:button, 'Rate the Product', class: 'rate_btn', id: 'rate_product')
      end
    end
  end

  def newupdaterating(product)
    # condition for update review
    rating = current_user.ratings.find_by(product_id: product.id)
    if rating
      button_to  'Submit', rating_path(rating.id), params: { product_id: product.id, stars: 'ratingsubmmitvalue' }, method: :patch, class: 'remove_promotion'
    else
      button_to  'Submit', ratings_path, params: { product_id: product.id, stars: 'ratingsubmmitvalue' }, method: :post, class: 'remove_promotion'
    end
  end
end
