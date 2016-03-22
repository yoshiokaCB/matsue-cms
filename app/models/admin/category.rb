class Admin::Category < ActiveRecord::Base
  has_many :pages,           through: :site_structures, source: :child
  has_many :site_structures, foreign_key: :parent_id
  has_one  :site_structure,  foreign_key: :category_id, dependent: :destroy

  accepts_nested_attributes_for :site_structure, allow_destroy: true

  def get_category_select_list(id)
    select_list = self.class.get_select_list(id, self)
    select_list.unshift([I18n.t("activerecord.attributes.admin/category.root_category"), 0])
    return select_list
  end


  # class methods

  class << self

    def get_all
      categories_all = {}
      self.all.each { |cate| categories_all[cate.id.to_s] = cate }
      return categories_all
    end

    def get_select_list(id, cate=nil)
      @categories_all ||= self.get_all
      cate_list_ary  = []
      structures     = Admin::SiteStructure.same_tree_structure_categories(id).default_order
      structures.each do |struct|
        if cate.present?
          next if cate.id == struct.category_id
        end
        category = @categories_all[struct.category_id.to_s]
        name = ("　"*struct.depth.to_i).to_s + category.display_name
        cate_list_ary << [name, category.id]

        # 下層がある場合は再帰的に下層を読み込む
        if struct.children_categories_count > 0
          get_select_list(category.id, cate).each{ |ary| cate_list_ary << ary }
        end
      end
      return cate_list_ary
    end

  end

end
