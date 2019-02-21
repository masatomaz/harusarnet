module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y-%m-%d　%H:%M　")
  end 
  
  def copyright
    text = "Copyright © 2018"
    if Date.today.year > 2018
      text << "-" + Date.today.year.to_s
    end
    text << " HarusarNet."
    text
  end
end
