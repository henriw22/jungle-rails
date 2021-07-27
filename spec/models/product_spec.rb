require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      category = Category.new(name: "Electronics")
      p = Product.create(
        name: "TV", 
        price: 800, 
        quantity: 1, 
        category: category,
      )
      expect(p).to be_valid
    end

    it "is not valid without a name" do
      category = Category.new(name: "Electronics")
      p = Product.create(
        name: nil, 
        price: 800, 
        quantity: 1, 
        category: category,
      )
      expect(p.errors.full_messages).to eq ["Name can't be blank"]
      expect(p).to_not be_valid
    end 

    it "is not valid without a price" do
      category = Category.new(name: "Electronics")
      p = Product.create(
        name: "TV", 
        price: nil, 
        quantity: 1, 
        category: category,
      )
      expect(p.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
      expect(p).to_not be_valid
    end 

    it "is not valid without a quantity" do
      category = Category.new(name: "Electronics")
      p = Product.create(
        name: "TV", 
        price: 800, 
        quantity: nil, 
        category: category,
      )
      expect(p.errors.full_messages).to eq ["Quantity can't be blank"]
      expect(p).to_not be_valid
    end 

    it "is not valid without a category" do
      p = Product.create(
        name: "TV", 
        price: 800, 
        quantity: 1, 
        category: nil,
      )
      expect(p.errors.full_messages).to eq ["Category can't be blank"]
      expect(p).to_not be_valid
    end 
  end
end
