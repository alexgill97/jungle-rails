require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves succesfully when all fields are valid' do
      @category = Category.create(id: 1, name: "Bakery")
      @product = Product.create(id: 1, name: "Loaf Pan", price_cents: 10000, quantity: 1, category_id: 1)

      expect(@product.save).to be true
    end

    it "has 'Name can't be blank' error when name is null" do
      @category = Category.create(id: 1, name: "Bakery")
      @product = Product.create(id: 1, name: nil, price_cents: 10000, quantity: 1, category_id: 1)

      expect(@product.errors.full_messages.include?("Name can't be blank")).to be true
    end
  end
end
