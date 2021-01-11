module FeatureTestHelpers
  def do_login(email, password)
    visit new_user_session_path
    fill_in('user_email', with: email)
    fill_in('user_password', with: password)
    click_button('Log in')
  end

  def do_sign_up(service)
    visit new_user_registration_path
    fill_in('user_name', with: 'user1')
    fill_in('user_email', with: 'user1@user.com')
    fill_in('user_password', with: 'user12')
    fill_in('user_password_confirmation', with: 'user12')
    find('#user_service').find(:option, service).select_option
    click_button('Sign up')
  end

  def do_sign_up_seller
    do_sign_up('customer and seller')
    fill_in('adress', with: 'adress')
    fill_in('shipping_adress', with: 'shipping_adress')
    find('#sel_detail_product_type').find(:option, 'general').select_option
    click_button('Complete the account')
  end

  def CreateProducts
    do_sign_up_seller
    visit new_product_path
    fill_in('product_photo', with: 'https://via.placeholder.com/600.png')
    fill_in('product_name', with: 'Product')
    fill_in('product_description', with: "
        It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
        ")
    fill_in('product_price', with: '1000')
    find('#product_categ').find(:option, 'general').select_option

    click_button('Create Product')
  end
end
