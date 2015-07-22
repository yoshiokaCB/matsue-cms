json.array!(@admin_pages) do |admin_page|
  json.extract! admin_page, :id, :display_name, :sub_display_name, :url_name, :description, :status, :date, :date_visible, :start_date, :end_date, :redirect_url, :redirect_target, :body_id, :meta_id, :replace_id, :lock_version
  json.url admin_page_url(admin_page, format: :json)
end
