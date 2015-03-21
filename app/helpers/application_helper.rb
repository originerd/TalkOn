module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Talk On"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # Replace devise's alert name to bootstrap's
  def bootstrap_class_for(flash_name)
    case flash_name
    when 'notice' then 'success'
    when 'alert'  then 'danger'
    else flash_name
    end
  end
end
