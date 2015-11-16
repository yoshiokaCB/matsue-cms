class CreateAdminPages < ActiveRecord::Migration
  def change
    create_table :admin_pages do |t|
      t.string :display_name
      t.string :sub_display_name
      t.string :url_name
      t.text :description
      t.integer :status
      t.datetime :date
      t.integer :date_visible
      t.datetime :start_date
      t.datetime :end_date
      t.string :redirect_url
      t.integer :redirect_target
      t.text :body_text
      t.integer :body_id
      t.integer :meta_id
      t.integer :replace_id
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
