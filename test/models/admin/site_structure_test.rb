require 'test_helper'

class Admin::SiteStructureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  context "階層構造のテスト" do
    setup do
      cate = Admin::Category.create(display_name: "hoge", url_name: "hgoe")
      @ss1 = Admin::SiteStructure.create(category_id: cate.id, parent_id: 1 )
      @ss2 = Admin::SiteStructure.create(category_id: cate.id, parent_id: 17 )
    end

    test "routesのセットテスト" do
      assert_not_nil @ss1.routes
      assert_equal "0-1", @ss1.routes
      assert_not_nil @ss2.routes
      assert_equal "0-2-13-17", @ss2.routes
    end

    test "depthのセットテスト" do
      assert_not_nil @ss1.depth
      assert_equal 2, @ss1.depth
      assert_not_nil @ss2.depth
      assert_equal 4, @ss2.depth
    end

  end

  context "カテゴリーを移動した倍の処理" do
    test "下層のカテゴリーのroutesも変化する。" do
    end
    test "下層のカテゴリーのdepthも変化する。" do
    end
  end

end
