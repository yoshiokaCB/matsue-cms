class Admin::SiteStructure < ActiveRecord::Base
  belongs_to :page,     class_name:'Admin::Page'
  belongs_to :child,    foreign_key: :parent_id, class_name: 'Admin::Page'
  belongs_to :parent,   class_name: 'Admin::Category'
  belongs_to :category, class_name: 'Admin::Category'

  before_save :set_routes, :set_depth
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

end
