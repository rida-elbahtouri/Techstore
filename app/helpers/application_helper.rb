module ApplicationHelper
  # this method check where to take user based on the service he chosed
  def accountcomplete(user)
    link = user.service
    if link == 'Both'
      link_to 'Here', new_both_detail_path
    elsif link == 'customer'
      link_to 'Here', new_cus_detail_path
    end
  end

  # this function check if user didn't complete his profile
  # and show a red warning on the top of the page
  # exept in the edit user page and adding details page
  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
  def checkaccount(user)
    return unless user

    link = user.service
    if (link == 'Both' && !user.sel_detail && !current_page?('/both_details/new') &&
      !current_page?("/users/edit.#{user.id}")) ||
       (link == 'customer' && !user.cus_detail && !current_page?('/cus_details/new') &&
       !current_page?("/users/edit.#{user.id}"))
      render 'layouts/checkaccount'
    end
  end

  # rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
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

  # rubocop:disable Naming/MethodName
  def showRatingbtn(product)
    # condition to show rate btn
    return unless Order.find_by(customer_id: current_user.id, product_id: product.id)

    rating = current_user.ratings.find_by(product_id: product.id)
    if rating
      content_tag(:button, 'Update your Rating', class: 'rate_btn', id: 'rate_product')
    else
      content_tag(:button, 'Rate the Product', class: 'rate_btn', id: 'rate_product')
    end
  end

  # rubocop:enable Naming/MethodName
  def newupdaterating(product)
    # condition for update review
    rating = current_user.ratings.find_by(product_id: product.id)
    if rating
      button_to 'Submit', rating_path(rating.id),
                params: { product_id: product.id, stars: 'ratingsubmmitvalue' },
                method: :patch, class: 'remove_promotion'
    else
      button_to 'Submit', ratings_path,
                params: { product_id: product.id, stars: 'ratingsubmmitvalue' },
                method: :post, class: 'remove_promotion'
    end
  end

  # rubocop:disable Naming/MethodName
  def Displayorder(orders)
    @orders = orders
    render 'orders/orders'
  end
  # rubocop:enable Naming/MethodName
end
