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
            @newprice = product.price - (product.price * product.promotion)/100
            @prod = product
            render "price"
        else
            content_tag(:span, "#{product.price} $")
        end
    end

    def addorgotobasket(product)
        @product = product
        basketproducts = current_user.baskets.pluck(:product_id)

        if basketproducts.include?(product.id)
            link_to "See Basket", baskets_path,class:"visit-basket"
        else
            render "products/addtocardbutton"
        end
    end

    def results(products)
        @products = products
        render "products/results"
    end
end
