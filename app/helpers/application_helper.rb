# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def friendly_datetime(datetime)
    if published_today? datetime
      datetime.strftime("%I:%M %P")      # 04:46 pm
    elsif published_this_year? datetime
      datetime.strftime("%b %d")         # Jan 04
    else
      datetime.strftime("%m/%d/%y")      # 12/17/09
    end
  end

  def published_today?(datetime)
    datetime.to_date == Time.zone.now.to_date
  end

  def published_this_year?(datetime)
    datetime.strftime("%Y") == Time.zone.now.strftime("%Y")
  end
end
