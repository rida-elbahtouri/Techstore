require 'rails_helper'

RSpec.describe CusDetail, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:adress) }
  end

  describe 'Associations' do
    it { should belong_to(:customer).class_name('User') }
  end
end
