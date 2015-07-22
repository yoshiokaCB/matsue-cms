class CreateAdminSiteStructures < ActiveRecord::Migration
  def change
    create_table :admin_site_structures do |t|
      t.integer :page_id
      t.integer :category_id
      t.integer :parent_id
      t.string :routes
      t.integer :category_primary
      t.integer :children_count
      t.integer :depth
      t.integer :sort

      t.timestamps null: false
    end
  end
end
