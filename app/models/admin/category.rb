class Admin::Category < ActiveRecord::Base
  has_many :pages,           through: :site_structures, source: :child
  has_many :site_structures, foreign_key: :parent_id
  has_one  :site_structure,  foreign_key: :category_id, dependent: :destroy

  accepts_nested_attributes_for :site_structure, allow_destroy: true


  # class methods

  class << self

    def get_all
      categories_all = []
      self.all.each { |cate| categories_all[cate.id] = cate }
      return categories_all
    end

  end

end
