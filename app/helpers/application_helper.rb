module ApplicationHelper
  def display_datetime(dt)
    dt = dt.in_time_zone('Eastern Time (US & Canada)')
    dt.strftime("%m/%d/%Y %l:%M%P %Z") 
  end
end
