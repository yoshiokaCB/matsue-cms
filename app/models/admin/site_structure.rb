class Admin::SiteStructure < ActiveRecord::Base
  belongs_to :page,     class_name:'Admin::Page'
  belongs_to :child,    foreign_key: :parent_id, class_name: 'Admin::Page'
  belongs_to :parent,   class_name: 'Admin::Category'
  belongs_to :category, class_name: 'Admin::Category'

  before_create :set_def
  before_save   :set_routes, :set_depth
  after_save    :set_lower, :set_children_count
  after_destroy :set_children_count

  def set_def
    self.sort = 0
    self.children_categories_count = 0
    self.children_pages_count = 0
  end

  def set_routes
    parent = self.class.where(id: self.parent_id).first
    self.routes =
        if parent.present?
          [parent.routes, parent.id].join("-")
        else
          "0"
        end
  end

  def set_depth
    parent = self.class.where(id: self.parent_id).first
    self.depth =
        if parent.present?
          parent.depth + 1
        else
          1
        end
  end

  def set_lower
    children = Admin::SiteStructure.where(parent_id: self.id)
    children.each { |child| child.save }
  end

  def set_children_count
    self.class.skip_callback(:save, :after, :set_lower, :set_children_count)
    ps = Admin::SiteStructure.where(id: self.parent_id).first
    if ps.present?
      ps.children_pages_count      = Admin::SiteStructure.where(parent_id: ps.id).where.not(page_id: nil).count
      ps.children_categories_count = Admin::SiteStructure.where(parent_id: ps.id).where.not(page_id: nil).count
      ps.save
    end
    self.class.set_callback(:save, :after, :set_lower, :set_children_count)
  end

  # instance methods

  def contents_title
    if cate = self.category
      cate.display_name
    elsif page = self.page
      page.display_name
    else
      raise("カテゴリーもページもありません。")
    end
  end

end
