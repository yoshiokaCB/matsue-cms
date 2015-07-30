json.array!(@admin_site_structures) do |admin_site_structure|
  json.extract! admin_site_structure, :id, :page_id, :category_id, :parent_id, :category_primary, :children_pages_count, :children_categories_count, :sort
  json.url admin_site_structure_url(admin_site_structure, format: :json)
end
