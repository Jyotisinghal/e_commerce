require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = create(:category)
  end

  def test_index
    get categories_path
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  def test_edit
    get edit_category_path(@category.id)
    assert_response :success
    assert_equal @category, assigns(:category)
  end

  def test_new
    get new_category_path
    assert_response :success
    assert_instance_of Category, assigns(:category)
  end

  def test_show
    get category_path(@category.id)
    assert_response :success
    assert_equal @category, assigns(:category)
  end

  def test_create
    assert_difference 'Category.count' do
      post categories_path, params: {
        category: {
          name: 'Red Shirt',
        }
      }
    end
    assert_response :redirect
  end

  def test_update
    assert_no_difference 'Category.count' do
      patch category_path(@category.id), params: {
        category: {
          name: 'Black Shirt'
        }
      }
    end
    assert_response :redirect
  end
end
