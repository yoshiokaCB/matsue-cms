require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  setup do
    @admin_category = admin_categories(:about)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_category" do
    assert_difference('Admin::Category.count') do
      post :create, admin_category: { body_id: @admin_category.body_id, date: @admin_category.date, date_visible: @admin_category.date_visible, default_body_id: @admin_category.default_body_id, description: @admin_category.description, display_name: @admin_category.display_name, lock_version: @admin_category.lock_version, meta_id: @admin_category.meta_id, status: @admin_category.status, tree_type: @admin_category.tree_type, url_name: @admin_category.url_name }
    end

    assert_redirected_to admin_category_path(assigns(:admin_category))
  end

  test "should show admin_category" do
    get :show, id: @admin_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_category
    assert_response :success
  end

  test "should update admin_category" do
    patch :update, id: @admin_category, admin_category: { body_id: @admin_category.body_id, date: @admin_category.date, date_visible: @admin_category.date_visible, default_body_id: @admin_category.default_body_id, description: @admin_category.description, display_name: @admin_category.display_name, lock_version: @admin_category.lock_version, meta_id: @admin_category.meta_id, status: @admin_category.status, tree_type: @admin_category.tree_type, url_name: @admin_category.url_name }
    assert_redirected_to admin_category_path(assigns(:admin_category))
  end

  test "should destroy admin_category" do
    assert_difference('Admin::Category.count', -1) do
      delete :destroy, id: @admin_category
    end

    assert_redirected_to admin_categories_path
  end
end
