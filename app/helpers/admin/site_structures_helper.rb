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

  def get_breadcrumbs(site_structure_id)
    html  = %*<ol class="breadcrumb">*
    html << %*<li>*
    html << link_to("トップ", admin_site_structures_path)
    html << %*</li>*
    site_structure = Admin::SiteStructure.where(id: site_structure_id).first
    if site_structure.present?
      routes        = site_structure.routes
      routes_id_ary = routes.split("-").map(&:to_i)
      routes_id_ary.shift
      routes_id_ary.each do |routes_id|
        cate      = @cate_all[routes_id]
        link_text = link_to(cate.display_name, admin_category_site_structures_path(routes_id))
        html     << %*<li>#{link_text}</li>*
      end
      html << %*<li class="active">#{site_structure.category.display_name}</li>*
    end
    html << "</ol>"

    return html
  end

end
