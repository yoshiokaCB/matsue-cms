class Admin::Page < ActiveRecord::Base
  has_many :categories, through: :site_structures, source: :parent
  has_many :site_structures, :dependent => :delete_all

  accepts_nested_attributes_for :site_structures, allow_destroy: true

end
