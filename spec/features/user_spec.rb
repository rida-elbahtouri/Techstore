require 'rails_helper'
require 'featuresHelper/featureHelper'
RSpec.describe 'registrations_controller', type: :system do
  include FeatureTestHelpers
  before :each do
    User.create(name: 'test_name', email: 'test@test.com',
                password: '123456', password_confirmation: '123456',
                service: 'customer')
  end
  describe 'signup/in user' do
    it 'sign up' do
      do_sign_up('customer and seller')
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
    it 'add additionl information of user' do
      do_sign_up('customer and seller')
      fill_in('adress', with: 'adress')
      fill_in('shipping_adress', with: 'shipping_adress')
      find('#sel_detail_product_type').find(:option, 'general').select_option
      click_button('Complete the account')
      expect(page).to have_content 'your information has been added succesfully'
    end
    it 'log in' do
      do_login('test@test.com', '123456')
      expect(page).to have_content 'Signed in successfully.'
    end
    it 'update user information' do
      do_login('test@test.com', '123456')
      visit edit_user_registration_path
      fill_in('user_name', with: 'user1')
      fill_in('user_email', with: 'user1@user.com')
      fill_in('user_current_password', with: '123456')
      fill_in('user_password', with: 'user12')
      fill_in('user_password_confirmation', with: 'user12')
      find('#user_service').find(:option, 'customer and seller').select_option
      click_button('Update')
      expect(page).to have_content 'Your account has been updated successfully.'
    end
  end
end
