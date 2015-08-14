require 'test_helper'

class Admin::SiteStructureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  context "階層構造のテスト" do
    setup do
      cate1 = Admin::Category.create(display_name: "hoge", url_name: "hgoe")
      @ss1 = Admin::SiteStructure.create(category_id: cate1.id, parent_id: 1 )
      cate2 = Admin::Category.create(display_name: "foo", url_name: "foo")
      @ss2 = Admin::SiteStructure.create(category_id: cate2.id, parent_id: 17 )
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

  context "下層のコンテンツのカウントのテスト" do
    test "新規登録したときに親のsite_structureのchildren_xxx_countが増える" do

      # 新規登録時
      # after_create
      # page, categoryを判別してそれぞれカウントアップ

      cate1 = Admin::Category.create(display_name: "hoge", url_name: "hgoe")
      ss1   = Admin::SiteStructure.create(category_id: cate1.id, parent_id: 1, children_pages_count: 0 )

      page = Admin::SiteStructure.create(page_id: 1, parent_id: ss1.id)
      ss   = Admin::SiteStructure.find page.parent_id
      assert_equal 1, ss.children_pages_count

      cate = Admin::SiteStructure.create(category_id: 1, parent_id: ss1.id)
      ss   = Admin::SiteStructure.find cate.parent_id
      assert_equal 1, ss.children_categories_count


      # 削除時
      # before_destroy
      # page, categoryを判別してそれぞれカウントダウン

      page.destroy
      ss   = Admin::SiteStructure.find page.parent_id
      assert_equal 0, ss.children_pages_count

      cate.destroy
      ss   = Admin::SiteStructure.find cate.parent_id
      assert_equal 0, ss.children_categories_count

    end
    test "削除したときに親のsite_structureのchildren_xxx_countが減る" do

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

  context "contents_titleのテスト" do
    test "ページのタイトルが表示される" do
      about = Admin::SiteStructure.find(1)
      assert_equal "About us", about.contents_title
    end
    test "カテゴリーのタイトルが表示される" do
      about = Admin::SiteStructure.find(7)
      assert_equal "service1", about.contents_title
    end
    test "とちらでも無い場合はRuntimeErrorが返される" do
      nothing = Admin::SiteStructure.new
      assert_raise(RuntimeError) { nothing.contents_title }
    end
  end

  # TODO コンテンツがcategoryかpageのどちらを含んでいるかを返す
  context "call_contentsのテスト" do
    setup do
      @structure_cate = Admin::SiteStructure.where.not(category_id: nil).first
      @structure_page = Admin::SiteStructure.where.not(page_id: nil).first
    end
    test "page_idがある場合はpageのオブジェクトが返る" do
      cate = @structure_cate.call_contents
      assert_not_nil cate
      assert_equal Admin::Category, cate.class
    end
    test "category_idがある場合はcategoryのオブジェクトが返る" do
      page = @structure_page.call_contents
      assert_not_nil page
      assert_equal Admin::Page, page.class
    end

  end

  private

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
