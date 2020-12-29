require 'rails_helper'

RSpec.describe SelDetail, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:shipping_adress) }
    it { should validate_presence_of(:product_type) }
  end

  describe 'Associations' do
    it { should belong_to(:seller).class_name('User') }
  end
end
