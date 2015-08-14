require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  context "set_categories_allのテスト" do
    test "Arrayが返ってくる。" do
      categories_all = get_categories_all
      assert_equal Array, categories_all.class
    end
  end

end
