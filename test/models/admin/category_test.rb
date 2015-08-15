require 'test_helper'

class Admin::CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  context "set_categories_allのテスト" do

    test "Arrayが返ってくる。" do
      categories_all = Admin::Category.get_all
      assert_equal Array, categories_all.class
      Admin::Category.all.each do |cate|
        assert_equal cate, categories_all[cate.id]
      end
    end

  end

end
