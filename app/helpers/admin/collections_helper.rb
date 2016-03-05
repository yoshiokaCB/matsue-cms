module Admin::CollectionsHelper
  def date_visible_collection
    [
        [t('date_visible.invisible'), Settings.common.date_visible.false],
        [t('date_visible.visible'), Settings.common.date_visible.true],
    ]
  end

  def status_collection
    [
        [t('status.invisible'), Settings.common.status.invisible],
        [t('status.visible'), Settings.common.status.visible],
    ]
  end
end
