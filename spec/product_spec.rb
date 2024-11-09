require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.create }
  let(:product) do
    Product.new(
      name: 'Name',
      price: 10,
      quantity: 1,
      category: category
    )
  end
  
  describe 'Validations' do
    # validation tests/examples here
    context "when all required fields are present" do
      it "should be valid" do
        expect(product.save).to be true
      end
    end

    context "when name is nil" do
      it "should be invalid" do
        product.name = nil
        expect(product.save).to be false
      end
    end

    context "when price is nil" do
      it "should be invalid" do
        product.price_cents = nil
        expect(product.save).to be false
      end
    end


    # %i(name price_cents quantity category).each do |field|
    #   context "when #{field} is nil" do
    #     it "should be invalid" do
    #       product.public_send("#{field}=", nil)
    #       expect(product.save).to be false
    #     end
    #   end
    # end

  end
end