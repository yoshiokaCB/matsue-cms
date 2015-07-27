module Admin::SiteStructuresHelper
  def contents_preview(site_structure)
  end
  def contents_edit(site_structure)
    if page = site_structure.page
      return link_to('Edit', edit_admin_page_path(page), class: 'btn')
    elsif cate = site_structure.category
      return link_to('Edit', edit_admin_category_path(cate), class: 'btn')
    else
      nil
    end
  end
  def contents_destroy(site_structure)
  end
end
