require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(20) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:categ) }
  end

  describe 'Associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:seller).class_name('User') }
    it { should have_many(:ratings).dependent(:destroy) }
    it { should have_many(:baskets).dependent(:destroy) }
    it { should have_many(:customers).through(:baskets).with_foreign_key('customer_id').dependent(:destroy) }
  end
end
