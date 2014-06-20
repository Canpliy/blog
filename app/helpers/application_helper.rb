module ApplicationHelper

  def format_time(time)
    time.year.to_s + "年" + time.month.to_s + "月" + time.day.to_s + "日"
  end

  def find_blogger
    User.find_by(admin: true)
  end

  def full_title(title)
    default_title = "零小白的博客"
    if title.blank?
      default_title
    else
      title + " | " + default_title
    end
  end

  def generate_edit_path_for(resource)
    "/#{resource.class.name.tableize}/#{resource.id}/edit"
  end

  def generate_destroy_path_for(resource)
    "/#{resource.class.name.tableize}/#{resource.id}"
  end
end
