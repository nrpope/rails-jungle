require 'rails_helper'

RSpec.describe Product, type: :model do

  subject {
    Product.new(name: "Anything",
                quantity: 20,
                category: Category.new(
                  name: "Testing"
                ))
  }


  describe 'Validations' do
    it "is valid with valid attributes" do
      subject.price = 200
      expect(subject).to be_valid
    end
    it "is not valid without a name" do
      subject.price = 200
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a price" do
      expect(subject).to_not be_valid
    end
    it "is not valid without a quantity" do
      subject.price = 200
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a category" do
      subject.price = 200
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end