require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:product_id) }
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:adress) }
  end

  describe 'Associations' do
    it { should belong_to(:seller).class_name('User') }
    it { should belong_to(:product) }
  end
end
