class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @products = Product.eager_load(:product_features, :product_identifiers)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def update; end

  def destroy; end

  private

  def product_params
    params.require(:product).permit(:name, :price, product_features_attributes:    %i[id name _destroy],
                                                   product_identifiers_attributes: %i[id name value _destroy])
  end
end
