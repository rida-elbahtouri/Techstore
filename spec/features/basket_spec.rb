require 'rails_helper'
require 'featuresHelper/featureHelper'
RSpec.describe 'baskets_controller', type: :system do
  include FeatureTestHelpers
  before :each do
    User.create(name: 'test_name', email: 'test@test.com',
                password: '123456', password_confirmation: '123456',
                service: 'Both')
  end
  describe 'create product' do
    it 'add product to basket' do
      CreateProducts()
      click_button('1')
      click_button('Add To Card')
      expect(page).to have_content 'your product has been added to card'
    end

    it 'remove product from basket' do
      CreateProducts()
      click_button('1')
      click_button('Add To Card')
      visit baskets_path
      click_on(class: 'delete-item')
      expect(page).to have_content 'your product has been removed succesfully'
    end
  end
end
