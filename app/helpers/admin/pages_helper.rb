module Admin::PagesHelper

  def select_status_for_page(f)
    html  = f.radio_button(:status, Admin::Page::StatusValue[:invisible])
    html << f.label(:status, t('status.invisible'))
    html << f.radio_button(:status, Admin::Page::StatusValue[:visible])
    html << f.label(:status, t('status.visible'))
  end

  def select_date_visible_for_page(f)
    html  = f.radio_button(:date_visible, Admin::Page::DateVisible[:invisible])
    html << f.label(:date_visible, t('date_visible.invisible'))
    html << f.radio_button(:date_visible, Admin::Page::DateVisible[:visible])
    html << f.label(:date_visible, t('date_visible.visible'))
  end
end
