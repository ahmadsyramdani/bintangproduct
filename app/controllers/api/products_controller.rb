class Api::ProductsController < ApplicationController
  before_action :check_product_key, only: [:create]
  before_action :find_product, except: [:index, :create]

  def index
    @products = Product.order("created_at DESC").page params[:page]
  end

  def create
    @product = Product.new(product_params)
    return render file: 'api/products/validate', status: :unprocessable_entity unless @product.save
    @message = "Product is created"
    SetProductStatusJob.set(wait: 3.minutes).perform_later(@product)
    return render file: 'api/products/show', status: :created
  end

  def show; end

  def update
    return render file: 'api/products/validate', status: :unprocessable_entity unless @product.update(product_params)
    @message = "Product is updated"
    render file: 'api/products/show', status: :ok
  end

  def destroy
    @product.destroy
    @message = "Product is deleted"
    render file: 'api/products/delete', status: :ok
  end

  private

  def check_product_key
    render file: 'api/products/error', status: :bad_request unless params.has_key?(:product)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    return render file: 'api/products/not_found', status: :not_found unless @product.present?
  end

  def product_params
    params.require(:product).permit(:name, :price, :category, :image, :email)
  end
end
