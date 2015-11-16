require 'test_helper'

class Admin::PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "set_default_value" do
    page = Admin::Page.new
    page.set_default_value
    assert_equal Settings.page.date_visible.false, page.date_visible
    assert_equal Settings.page.status.invisible, page.status
  end
end
