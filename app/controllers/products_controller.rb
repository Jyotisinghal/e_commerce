class ProductsController < ApplicationController
	before_action :set_product, only: %i[edit show update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit; end

  def show; end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product Successfully Created!'
    else
      flash.now[:alert] = "There were problems with the following fields: #{@product.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def update
    if @product.update(product_params)
      debugger
      redirect_to products_path, notice: 'Product Successfully Updated!'
    else
      flash.now[:alert] = "There were problems with the following fields: #{@product.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :category_id, tag_ids: [])
  end
end
