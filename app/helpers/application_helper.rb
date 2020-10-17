module ApplicationHelper
   def image(product)
        if product.photo
            image_tag(product.photo, class: 'img')
        else
            content_tag(:div, 'No photo')
        end
end
end
