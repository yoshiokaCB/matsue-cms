require 'test_helper'

class Admin::SiteStructuresHelperTest < ActionView::TestCase

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

  # TODO 上と同じく contents_title_html のテストを書く

end
