require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with all proper data' do
      cat1 = Category.create()
      product = cat1.products.create( name: 'abc', price: 1, quantity: 1)
      expect(product).to be_valid
    end

    it 'is invalid without a product name' do
      cat1 = Category.create()
      product = cat1.products.create( name: nil, price: 1, quantity: 1)
      expect(product).not_to be_valid
    end

    it 'is invalid without a product price' do
      cat1 = Category.create()
      product = cat1.products.create( name: 'abc', price: nil, quantity: 1)
      expect(product).not_to be_valid
    end

    it 'is invalid without a product quantity' do
      cat1 = Category.create()
      product = cat1.products.create( name: 'abc', price: 1, quantity: nil)
      expect(product).not_to be_valid
    end

    it 'is invalid without category' do
      product = Product.create( name: 'abc', price: 1, quantity: 1)
      expect(product).not_to be_valid
    end

  end
end
