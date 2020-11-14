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
end
