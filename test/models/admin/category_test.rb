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
      assert_equal Hash, @categories_all.class

      # idとオブジェクトが一致するか確認
      Admin::Category.all.each do |cate|
        assert_equal cate, @categories_all[cate.id.to_s]
      end
    end

  end

  context "セレクトフィールド用のカテゴリー一覧を返す" do
    setup do
      @select_list = Admin::Category.get_select_list(0)
    end
    test "Arrayが返ってくる" do
      assert_equal Array, @select_list.class
    end
    test "カウントのテスト" do
      @select_list.count
      assert_equal @categories_all.count, @select_list.count
    end
    test "順番のテスト（site_structureのidを一致させる）" do
      result = []
      @select_list.each do |a|
        cate = Admin::Category.find_by(id: a[1])
        result << cate.site_structure.id
      end
      exp = [1, 2, 13, 16, 17, 14, 15, 3, 4, 5, 6]
      assert_equal exp, result
    end
  end

end
