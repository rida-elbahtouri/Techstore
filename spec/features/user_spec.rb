require 'rails_helper'

RSpec.describe 'registrations_controller', type: :system do
  before :each do
    User.create(name: 'test_name', email: 'test@test.com',
                password: '123456', password_confirmation: '123456',
                service: 'customer')
  end
  describe 'signup/in user' do
    it 'sign up' do
      visit new_user_registration_path
      fill_in('user_name', with: 'user1')
      fill_in('user_email', with: 'user1@user.com')
      fill_in('user_password', with: 'user12')
      fill_in('user_password_confirmation', with: 'user12')
      find('#user_service').find(:option, 'customer and seller').select_option
      click_button('Sign up')
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
