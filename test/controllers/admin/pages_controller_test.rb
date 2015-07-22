require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @admin_page = admin_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_page" do
    assert_difference('Admin::Page.count') do
      post :create, admin_page: { body_id: @admin_page.body_id, date: @admin_page.date, date_visible: @admin_page.date_visible, description: @admin_page.description, display_name: @admin_page.display_name, end_date: @admin_page.end_date, lock_version: @admin_page.lock_version, meta_id: @admin_page.meta_id, redirect_target: @admin_page.redirect_target, redirect_url: @admin_page.redirect_url, replace_id: @admin_page.replace_id, start_date: @admin_page.start_date, status: @admin_page.status, sub_display_name: @admin_page.sub_display_name, url_name: @admin_page.url_name }
    end

    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  test "should show admin_page" do
    get :show, id: @admin_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_page
    assert_response :success
  end

  test "should update admin_page" do
    patch :update, id: @admin_page, admin_page: { body_id: @admin_page.body_id, date: @admin_page.date, date_visible: @admin_page.date_visible, description: @admin_page.description, display_name: @admin_page.display_name, end_date: @admin_page.end_date, lock_version: @admin_page.lock_version, meta_id: @admin_page.meta_id, redirect_target: @admin_page.redirect_target, redirect_url: @admin_page.redirect_url, replace_id: @admin_page.replace_id, start_date: @admin_page.start_date, status: @admin_page.status, sub_display_name: @admin_page.sub_display_name, url_name: @admin_page.url_name }
    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  test "should destroy admin_page" do
    assert_difference('Admin::Page.count', -1) do
      delete :destroy, id: @admin_page
    end

    assert_redirected_to admin_pages_path
  end
end
