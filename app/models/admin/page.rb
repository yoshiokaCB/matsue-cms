class Admin::Page < ActiveRecord::Base
  has_many :categories, through: :site_structures, source: :parent
  has_many :site_structures, :dependent => :delete_all

  accepts_nested_attributes_for :site_structures, allow_destroy: true

  StatusValue = {
      invisible: 0, # 非公開
      visible: 1,   # 公開
  }
  DateVisible = {
      invisible: 0, # 非表示
      visible: 1,   # 表示
  }

  def set_default_value
    self.status       ||= StatusValue[:invisible]
    self.date_visible ||= DateVisible[:invisible]
  end

end
