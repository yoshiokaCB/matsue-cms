require 'test_helper'

class Admin::SiteStructuresControllerTest < ActionController::TestCase
  setup do
    @admin_site_structure = admin_site_structures(:service)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_site_structures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_site_structure" do
    assert_difference('Admin::SiteStructure.count') do
      post :create, admin_site_structure: { category_id: @admin_site_structure.category_id, category_primary: @admin_site_structure.category_primary, children_count: @admin_site_structure.children_count, page_id: @admin_site_structure.page_id, parent_id: @admin_site_structure.parent_id, sort: @admin_site_structure.sort }
    end

    assert_redirected_to admin_site_structure_path(assigns(:admin_site_structure))
  end

  test "should show admin_site_structure" do
    get :show, id: @admin_site_structure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_site_structure
    assert_response :success
  end

  test "should update admin_site_structure" do
    patch :update, id: @admin_site_structure, admin_site_structure: { category_id: @admin_site_structure.category_id, category_primary: @admin_site_structure.category_primary, children_count: @admin_site_structure.children_count, page_id: @admin_site_structure.page_id, parent_id: @admin_site_structure.parent_id, sort: @admin_site_structure.sort }
    assert_redirected_to admin_site_structure_path(assigns(:admin_site_structure))
  end

  test "should destroy admin_site_structure" do
    assert_difference('Admin::SiteStructure.count', -1) do
      delete :destroy, id: @admin_site_structure
    end

    assert_redirected_to admin_site_structures_path
  end
end
