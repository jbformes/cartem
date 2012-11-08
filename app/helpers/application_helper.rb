module ApplicationHelper

  def error_messages_for(resource)
    render "shared/error_messages", :resource => resource
  end

  def flash_messages
    flash.collect do |key, msg|
      content_tag :div, msg, :id => key, :class => "alert"
    end.join.html_safe
  end

end
