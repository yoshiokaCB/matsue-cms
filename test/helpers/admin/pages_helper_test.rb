require 'test_helper'
require 'nested_form'
include NestedForm
include ViewHelper


class Admin::PagesHelperTest < ActionView::TestCase
  setup do
    @admin_page = admin_pages(:one)
    nested_form_for(@admin_page) { |f| @f = f }
  end
  # context "select_status_for_page" do
  #   test "選択肢がある" do
  #     result = select_status_for_page(@f)
  #     assert_equal ActiveSupport::SafeBuffer, result.class
  #   end
  # end
end
