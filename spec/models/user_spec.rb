require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with all proper data' do
      cat1 = Category.create()
      user = cat1.users.create( name: 'abc', price: 1, quantity: 1)
      expect(user).to be_valid
    end
end
