require 'test_helper'

class Admin::CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @categories_all = Admin::Category.get_all
  end

  context "set_categories_allのテスト" do

    test "Arrayが返ってくる。" do
      assert_equal Array, @categories_all.class

      # idとオブジェクトが一致するか確認
      Admin::Category.all.each do |cate|
        assert_equal cate, @categories_all[cate.id]
      end
    end

  end

  context "セレクトフィールド用のカテゴリー一覧を返す" do
    test "Arrayが返ってくる" do
      select_list = Admin::Category.get_select_list(0)
      assert_equal Array, select_list.class

    end
  end

end
