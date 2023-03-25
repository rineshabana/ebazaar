class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product, only: %i[show edit]
  before_action :init_form_data, only: %i[new edit]
  access all: %i[show index], seller: { except: [:destroy] }, admin: :all

  def index
    @nav = nil
    if params[:cat_id].nil?
      products = Product
    else
      category = Category.find(params[:cat_id])
      products = category.products
      @nav = "nav-#{category.id}"
    end
    @products = products.eager_load(:product_features, :product_identifiers).page(params[:page]).per(8)
  end

  def show
    ids = @product.categories.map(&:product_ids).flatten - [@product.id]
    @related = Product.where(id: ids.sample(4))
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.save
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    ActiveStorage::Blob.unattached.each(&:purge_later)
  end

  def destroy; end

  private

  def init_form_data
    @categories = Category.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :content, support_images:                 [],
                                                                     category_ids:                   [],
                                                                     product_features_attributes:    %i[id name _destroy],
                                                                     product_identifiers_attributes: %i[id name value _destroy])
  end
end
