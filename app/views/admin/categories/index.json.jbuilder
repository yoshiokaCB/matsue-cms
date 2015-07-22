json.array!(@admin_categories) do |admin_category|
  json.extract! admin_category, :id, :display_name, :url_name, :description, :status, :date, :date_visible, :tree_type, :body_id, :default_body_id, :meta_id, :lock_version
  json.url admin_category_url(admin_category, format: :json)
end
