module ApplicationHelper
  def display_fix(str)
    simple_format(str)
  end

  def display_time(time)
    time.try(:strftime, "%l:%M%P %b. %e, %Y (%Z)")
  end
end
