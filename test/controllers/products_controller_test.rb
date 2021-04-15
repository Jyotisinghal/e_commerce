require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @product = create(:product)
  end

  def test_index
    get products_path
    assert_response :success
    assert_not_nil assigns(:products)
  end

  def test_edit
    get edit_product_path(@product.id)
    assert_response :success
    assert_equal @product, assigns(:product)
  end

  def test_new
    get new_product_path
    assert_response :success
    assert_instance_of Product, assigns(:product)
  end

  def test_show
    get product_path(@product.id)
    assert_response :success
    assert_equal @product, assigns(:product)
  end

  def test_create
    assert_difference 'Product.count' do
      post categories_path, params: {
        product: {
          name: 'Shirt',
          price: 10.0
        }
      }
    end
    assert_response :redirect
  end

  def test_update
    assert_no_difference 'Product.count' do
      patch product_path(@product.id), params: {
        product: {
          name: 'Black Shirt'
        }
      }
    end
    assert_response :redirect
  end
end
