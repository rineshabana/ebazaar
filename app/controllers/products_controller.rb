class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product, only: [:show]
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
    @product.image.attach(product_params[:image])
    @product.support_images.attach(product_params[:support_images])
    @product.save
  end

  def update; end

  def destroy; end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, support_images:                 [],
                                                           product_features_attributes:    %i[id name _destroy],
                                                           product_identifiers_attributes: %i[id name value _destroy])
  end
end
