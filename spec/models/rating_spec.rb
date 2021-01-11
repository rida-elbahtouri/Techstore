require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:stars) }
    it { should validate_inclusion_of(:stars).in_array([1, 2, 3, 4, 5]) }
  end

  describe 'Associations' do
    it { should belong_to(:customer).class_name('User') }
    it { should belong_to(:product) }
  end
end
