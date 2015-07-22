class Admin::Category < ActiveRecord::Base
  has_many :pages,           through: :site_structures, source: :child
  has_many :site_structures, foreign_key: :parent_id
  has_one  :site_structure,  foreign_key: :category_id, dependent: :destroy

  accepts_nested_attributes_for :site_structure, allow_destroy: true

end
