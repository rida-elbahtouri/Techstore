require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'test_name', email: 'test@test.com',
                password: '123456', password_confirmation: '123456',
                service: 'customer')
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    it 'is valid when name is not blank' do
      subject.name = 'Joe'
      expect(subject).to be_valid
    end

    it 'is invalid when name is blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:comments).with_foreign_key('customer_id') }
    it { should have_many(:ratings).with_foreign_key('customer_id') }
    it { should have_many(:goods).class_name('Product').with_foreign_key('seller_id') }
    it { should have_many(:baskets).with_foreign_key('customer_id') }
    it { should have_many(:orders).with_foreign_key('seller_id') }
    it { should have_many(:products).through(:baskets).with_foreign_key('product_id') }
    it { should have_one(:cus_detail).with_foreign_key('customer_id') }
    it { should have_one(:sel_detail).with_foreign_key('seller_id') }
  end
end
