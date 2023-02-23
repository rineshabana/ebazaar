class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product, only: [:show]
  def index
    @products = Product.eager_load(:product_features, :product_identifiers)
  end

  def show; end

  def new
    @product = Product.new
    init_form_data
  end

  def edit; end

  def create
    params_h = product_params
    params_h[:categories] = distinct_categories(params_h[:categories])
    @product = Product.new(params_h)
    @product.save
  end

  def update; end

  def destroy; end

  private

  def distinct_categories(categories)
    Category.where(id: categories.reject { |x| x == '' }.map(&:to_i))
  end

  def init_form_data
    @categories = Category.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, support_images:                 [],
                                                           categories:                     [],
                                                           product_features_attributes:    %i[id name _destroy],
                                                           product_identifiers_attributes: %i[id name value _destroy])
  end
end
