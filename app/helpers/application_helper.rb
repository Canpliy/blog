module ApplicationHelper
  def format_time(time)
    time.year.to_s + "年" + time.month.to_s + "月" + time.day.to_s + "日"
  end
end
