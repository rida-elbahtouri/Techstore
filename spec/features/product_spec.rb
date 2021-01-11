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
      CreateProducts()
      expect(page).to have_content 'your product has been created succesfully'
    end
  end
end
