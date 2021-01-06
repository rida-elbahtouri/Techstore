require 'rails_helper'
require 'featuresHelper/featureHelper'
RSpec.describe 'products_controller', type: :system do
  include FeatureTestHelpers
  before :each do
    User.create(name: 'test_name', email: 'test@test.com',
                password: '123456', password_confirmation: '123456',
                service: 'Both')
  end
  describe 'create product' do
    it 'create product' do
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
      expect(page).to have_content 'your product has been created succesfully'
    end
  end
end
