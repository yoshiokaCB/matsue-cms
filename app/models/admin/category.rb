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

    def get_select_list(id)
      @categories_all ||= self.get_all
      cate_list_ary = []
      cates         = Admin::SiteStructure.where(parent_id: id).where(page_id: nil)
      cates.each do |cate|
        category = @categories_all[cate.category_id]
        cate_list_ary << [category.display_name, category.id]
      end
      return cate_list_ary

    end

  end

end
