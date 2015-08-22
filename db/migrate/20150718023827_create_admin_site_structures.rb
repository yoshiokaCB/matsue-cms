class CreateAdminSiteStructures < ActiveRecord::Migration
  def change
    create_table :admin_site_structures do |t|
      t.integer :page_id
      t.integer :category_id
      t.integer :parent_id
      t.string  :routes
      t.integer :category_primary # 主カテゴリー
      t.integer :children_pages_count
      t.integer :children_categories_count
      t.integer :is_sub_display_name
      t.integer :depth
      t.integer :sort

      t.timestamps null: false
    end
  end
end
