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
      title    = site_structure.contents_title
    elsif site_structure.category
      css_name = "cate"
      title    = link_to(site_structure.contents_title, admin_category_site_structures_path(site_structure.id))
    else
      raise RuntimeError
    end
    %*<span class="#{css_name}">#{title}</span>*
  end

  def get_breadcrumbs(id)
    cate           = Admin::Category.find(id)
    site_structure = cate.site_structure
    routes         = site_structure.routes
  end

end
