require 'test_helper'

class Admin::PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "set_default_value" do
    page = Admin::Page.new
    page.set_default_value
    assert_equal Admin::Page::DateVisible[:invisible], page.date_visible
    assert_equal Admin::Page::StatusValue[:invisible], page.status
  end
end
