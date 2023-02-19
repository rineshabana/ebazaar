class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  # before_action :set_product, only: [:show]
  def index
    @products = Product.eager_load(:product_features, :product_identifiers)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image])
    @product.save
  end

  def update; end

  def destroy; end

  private

  def set_product
    @product = Product.find(params[:id]).with_attached_images
  end

  def product_params
    params.require(:product).permit(:name, :price, product_features_attributes:    %i[id name _destroy],
                                                   product_identifiers_attributes: %i[id name value _destroy])
  end
end
