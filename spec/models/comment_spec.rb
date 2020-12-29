require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(20).is_at_most(500) }
  end

  describe 'Associations' do
    it { should belong_to(:customer).class_name('User') }
    it { should belong_to(:product) }
  end
end
