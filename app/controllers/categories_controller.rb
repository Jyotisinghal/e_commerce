class CategoriesController < ApplicationController
	before_action :set_category, only: %i[edit show update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit; end

  def show; end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category Successfully Created!'
    else
      flash.now[:alert] = error_message(@category)
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category Successfully Updated!'
    else
      flash.now[:alert] = error_message(@category)
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
