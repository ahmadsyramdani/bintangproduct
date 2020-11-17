require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:products) { FactoryBot.create(:product, image: fixture_file_upload('files/sample.png', 'image/png')) }

  describe "GET /products" do
    it "should request success" do
      get api_products_path
      expect(JSON.parse(response.body)["total"]).to eq(1)
      expect(JSON.parse(response.body)["current_page"]).to eq(1)
      expect(response.status).to eq(200)
    end
  end

  describe "POST /products" do
    it "should post product with error validation" do
      post api_products_path, params: {
        product: {
          name: "Pepsi Cola",
          price: 30000,
          category: "Drink",
          email: "pepsi@mailnesia.com"
        }
      }
      expect(JSON.parse(response.body)['message']).to eq("Image can't be blank")
      expect(response.status).to eq(422)
    end

    it "should post product with error bad request" do
      post api_products_path, params: {
        name: "Pepsi Cola",
        price: 30000,
        image: fixture_file_upload('files/sample.png', 'image/png'),
        category: "Drink",
        email: "pepsi@mailnesia.com"
      }
      expect(JSON.parse(response.body)['message']).to eq("Bad request. 'product' key is required")
      expect(response.status).to eq(400)
    end

    it "should post product with success" do
      post api_products_path, params: {
        product: {
          name: "Pepsi Cola",
          price: 30000,
          image: fixture_file_upload('files/sample.png', 'image/png'),
          category: "Drink",
          email: "pepsi@mailnesia.com"
        }
      }
      expect(JSON.parse(response.body)['message']).to eq("Product is created")
      expect(response.status).to eq(201)
    end

  end

  describe "GET /products/:id" do
    let!(:product) { FactoryBot.create(:product, image: fixture_file_upload('files/sample.png', 'image/png')) }

    it "should return not found" do
      get api_product_path(100000)
      expect(JSON.parse(response.body)['message']).to eq("Data not found")
      expect(response.status).to eq(404)
    end

    it "should return success" do
      get api_product_path(product)
      expect(JSON.parse(response.body)['message']).to eq("ok")
      expect(response.status).to eq(200)
    end
  end

  describe "PUT /products/:id" do
    let!(:product) { FactoryBot.create(:product, image: fixture_file_upload('files/sample.png', 'image/png')) }

    it "should return not found" do
      put api_product_path(100000), params: {
        product: {
          name: "Pepsi Cola",
          price: 30000,
          category: "Drink",
          email: "pepsi@mailnesia"
        }
      }
      expect(JSON.parse(response.body)['message']).to eq("Data not found")
      expect(response.status).to eq(404)
    end

    it "should return validation error" do
      put api_product_path(product), params: {
        product: {
          name: "Pepsi Cola",
          price: 30000,
          category: "Drink",
          email: "pepsi@mailnesia"
        }
      }
      expect(JSON.parse(response.body)['message']).to eq("Email is not an email")
      expect(response.status).to eq(422)
    end

    it "should return success updated a product" do
      put api_product_path(product), params: {
        product: {
          name: "Pepsi Cola",
          price: 30000,
          category: "Drink",
          email: "pepsi@mailnesia.com"
        }
      }
      expect(JSON.parse(response.body)['message']).to eq("Product is udated")
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /products/:id" do
    let!(:product) { FactoryBot.create(:product, image: fixture_file_upload('files/sample.png', 'image/png')) }

    it "should return not found" do
      delete api_product_path(100000)
      expect(JSON.parse(response.body)['message']).to eq("Data not found")
      expect(response.status).to eq(404)
    end

    it "should return success deleted a product" do
      delete api_product_path(product)
      expect(JSON.parse(response.body)['message']).to eq("Product is deleted")
      expect(response.status).to eq(200)
    end
  end
end
