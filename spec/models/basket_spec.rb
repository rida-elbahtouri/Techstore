require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:quantity) }
  end

  describe 'Associations' do
    it { should belong_to(:customer).class_name('User') }
    it { should belong_to(:product) }
  end
end
