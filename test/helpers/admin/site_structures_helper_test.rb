require 'test_helper'

class Admin::SiteStructuresHelperTest < ActionView::TestCase
  context "link_contents_edit" do
    test "category_idがある場合、リンクがカテゴリーの編集になる" do
      site_structure = Admin::SiteStructure.where.not(category_id: nil).first
      html = link_contents_edit(site_structure)
      assert_equal ActiveSupport::SafeBuffer, html.class
      assert html.include?('categories')
    end

    test "page_idがある場合、リンクがページの編集になる" do
      site_structure = Admin::SiteStructure.where.not(page_id: nil).first
      html = link_contents_edit(site_structure)
      assert_equal ActiveSupport::SafeBuffer, html.class
      assert html.include?('pages')
    end

    test "page_id, category_id のどちらも無い場合" do
      site_structure = Admin::SiteStructure.new
      assert_raise(RuntimeError) { link_contents_edit(site_structure) }
    end

  end

  context "contents_title_htmlのテスト" do

    test "categoryがある場合、カテゴリーのdisplay_nameを表示" do
      site_structure = Admin::Category.where(url_name: "about_us").first.site_structure
      html = contents_title_html(site_structure)
      assert_equal String, html.class
      assert html.include?('class="cate"')
      assert html.include?('About us')
    end

    test "categoryがある場合、タイトルには下層のリンクテキストが表示される。" do
      site_structure = Admin::Category.where(url_name: "about_us").first.site_structure
      html = contents_title_html(site_structure)
      assert_equal String, html.class
      url = admin_category_site_structures_path(site_structure.id)
      assert html.include?(url)
    end

    test "pageがある場合、ページのdisplay_nameを表示" do
      site_structure = Admin::Page.where(url_name: "service1").first.site_structures.first
      html = contents_title_html(site_structure)
      assert_equal String, html.class
      assert html.include?('class="page"')
      assert html.include?('service1')
    end

    test "page, category のどちらも無い場合" do
      site_structure = Admin::SiteStructure.new
      assert_raise(RuntimeError) { contents_title_html(site_structure) }
    end
  end

  context "get_breadcrumbsのテスト" do
    setup do
      @category = Admin::Category.where(url_name: "markup").first
      @cate_all = Admin::Category.get_all
    end

    test "Stringが返ってくる。" do
      breadcrumbs = get_breadcrumbs(@category.id)
      assert_equal String, breadcrumbs.class
    end

  end

end
