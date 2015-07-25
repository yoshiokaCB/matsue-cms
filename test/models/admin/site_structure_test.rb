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

  context "下層のカテゴリー、ページのカウントのテスト" do
    test "saveされたときに上位のカテゴリーのcountを更新する" do

    end
  end

  context "カテゴリーを移動した倍の処理" do
    setup do
      @service = Admin::SiteStructure.find(2)
      @service.parent_id = 1
      @service.save
    end
    test "下層のカテゴリーのroutesも変化する。" do
      check_lower_routes(@service)
    end
    test "下層のカテゴリーのdepthも変化する。" do
      check_lower_depth(@service)
    end
  end

  def check_lower_routes(parent)
    children = Admin::SiteStructure.where(parent_id: parent.id)
    routes   = parent.routes + "-" + parent.id.to_s
    children.each do |child|
      assert_equal routes, child.routes
      if Admin::SiteStructure.where(parent_id: parent.id).count > 0
        check_lower_routes(child)
      end
    end
  end

  def check_lower_depth(parent)
    children = Admin::SiteStructure.where(parent_id: parent.id)
    depth    = parent.depth + 1
    children.each do |child|
      assert_equal depth, child.depth
      if Admin::SiteStructure.where(parent_id: parent.id).count > 0
        check_lower_depth(child)
      end
    end
  end

end
