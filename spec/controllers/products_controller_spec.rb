require 'rails_helper'

describe ProductsController do
  describe "GET #index" do
    it "assigns @products and renders the index template" do
      product = Product.create( name: "Chair", description: "Loverly", price: 50)
      get :index

      expect(assigns(:products)).to eq([product])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns @product and renders the show template" do
      product = Product.create( name: "Chair", description: "Loverly", price: 50)

      get :show, id: product.id

      expect(assigns(:product)).to eq(product)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    let( :product) { Product.create(
                      name: "Chair",
                      description: "Loverly",
                      price: 50
                    ) }
    before do
      get :edit, id: product.id
    end
    it "assigns the requested product as @product" do
      expect(assigns(:product)).to eq(product)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) {
        { product: {   name: "Chair",
          description: "Loverly",
          price: 50}}
      }
      it "creates a new product" do
        expect {
          post :create, valid_params
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, valid_params
        expect(response).to redirect_to(Product.last)
      end

      it "assigns a newly created recipe as @recipe" do
        post :create, valid_params
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end
    end

    context "with invalid_params" do

    end
  end

end
