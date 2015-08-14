module ApplicationHelper
  def get_categories_all
    categories_all = []
    Admin::Category.all.each { |cate| categories_all[cate.id] = cate }
    return categories_all
  end
  def get_site_structures_categories_all
    structures_categories_all = []
    Admin::SiteStructure.all.each { |cate| structures_categories_all[cate.id] = cate }
    return structures_categories_all
  end
end
