module Admin
  def self.table_name_prefix
    'admin_'
  end
  Status = {
      invisible: 0,
      visible: 1,
      limit: 2,
      ringi: 3,
  }
  DateView = {
      hidden: 0,
      display: 1,
  }
end
