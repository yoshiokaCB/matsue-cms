module Admin::SiteStructuresHelper
  def contents_preview(site_structure)
  end

  def link_contents_edit(site_structure)
    edit_path =
        if page = site_structure.page
          edit_admin_page_path(page)
        elsif cate = site_structure.category
          edit_admin_category_path(cate)
        else
          raise "ページもカテゴリーもありません"
        end
    link_to(t('common.edit'), edit_path, class: 'btn')
  end

  def contents_title_html(site_structure)
    if site_structure.page
      css_name = "page"
    elsif site_structure.category
      css_name = "cate"
    end
    %*<span class="#{css_name}">#{site_structure.contents_title}</span>*
  end

  def contents_destroy(site_structure)
  end
end
