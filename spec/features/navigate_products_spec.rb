require "rails_helper"

describe "Navigating products" do
  it "allows navigation from the detail page (ie show) to the listing page (ie index)" do
    product = Product.create(name:"table", description:"great", price:70)
    visit product_url(product)
    click_link "Back"

    expect(current_path).to eq(products_path)
  end

end
