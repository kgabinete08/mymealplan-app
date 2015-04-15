module ApplicationHelper
  def display_fix(str)
    simple_format(str)
  end

  def display_time(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end
    time.try(:strftime, "%l:%M%P %b. %e, %Y (%Z)")
  end
end
