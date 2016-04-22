require 'rails_helper'


describe Product do
  describe "validations" do
    it "requires a name" do
      product = Product.new(name: "")
      product.valid?
      expect(product.errors).to have_key(:name)
    end
    it "does not require a description" do
      product = Product.new(description: nil)
      product.valid?
      expect(product.errors).not_to have_key(:description)
    end
    it "does not require a price" do
      product = Product.new(price: nil)
      product.valid?
      expect(product.errors).not_to have_key(:price)
    end
    context "when name format is a string containing letters only" do
      it "validates names that contains only letters and spaces" do
        valid_names = ["Tom", "Dick", "harry", "kate moss"]
        valid_names.each do | valid_name |
          product = Product.new(name: valid_name)
          product.valid?
          expect(product.errors).not_to have_key(:name)
      end
    end
  end
    context "when name format is not a string containing only letters" do
      it "does not validate names that contain numbers" do
        invalid_names = ["tommy1", "25442", "@jeremy"]
        invalid_names.each do | invalid_name |
          product = Product.new(name: invalid_name)
          product.valid?
          expect(product.errors).to have_key(:name)
          end
      end
    end
  end

  describe "#bargain?" do
    it "is true if price is less than 50" do
      product = Product.new(price: 20)
      expect(product.bargain?).to eq(true)
    end
    it "is false if price is more than 50" do
      product = Product.new(price: 100)
      expect(product.bargain?).to eq(false)
    end
  end
end
