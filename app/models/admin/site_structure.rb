class Admin::SiteStructure < ActiveRecord::Base
  belongs_to :page,     class_name:'Admin::Page'
  belongs_to :child,    foreign_key: :parent_id, class_name: 'Admin::Page'
  belongs_to :parent,   class_name: 'Admin::Category'
  belongs_to :category, class_name: 'Admin::Category'

  before_destroy :set_parent_count_down
  before_save :set_routes, :set_depth#, :set_children_count
  after_create :set_parent_count_up
  after_save  :set_lower

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
    self.children_pages_count      = Admin::SiteStructure.where(parent_id: self.id).where.not(page_id: nil).count
    self.children_categories_count = Admin::SiteStructure.where(parent_id: self.id).where.not(category_id: nil).count
  end

  def set_parent_count_up
    self.class.skip_callback(:save, :after, :set_lower)
    if self.page_id.present? && parent_site_structure = Admin::SiteStructure.where(id: self.parent_id).first
      parent_site_structure.children_pages_count += 1
      parent_site_structure.save
    end
    if self.category_id.present? && parent_site_structure = Admin::SiteStructure.where(id: self.parent_id).first
      parent_site_structure.children_categories_count += 1
      parent_site_structure.save
    end
    self.class.set_callback(:save, :after, :set_lower)
  end

  def set_parent_count_down
    self.class.skip_callback(:save, :before, :set_children_count)
    self.class.skip_callback(:save, :after, :set_lower)
    if self.page_id.present? && parent_site_structure = Admin::SiteStructure.where(id: self.parent_id).first
      parent_site_structure.children_pages_count -= 1
      parent_site_structure.save
    end
    if self.category_id.present? && parent_site_structure = Admin::SiteStructure.where(id: self.parent_id).first
      parent_site_structure.children_categories_count -= 1
      parent_site_structure.save
    end
    self.class.set_callback(:save, :before, :set_children_count)
    self.class.set_callback(:save, :after, :set_lower)
  end

end
