class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories do |t|
      t.string :display_name
      t.string :url_name
      t.text :description
      t.integer :status
      t.datetime :date
      t.integer :date_visible
      t.integer :tree_type
      t.integer :body_id
      t.integer :default_body_id
      t.integer :meta_id
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
