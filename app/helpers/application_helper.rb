module ApplicationHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error

      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert alert-#{type} fade show #{tag_class}",
        role: "alert"
      }.merge(options)

      dismiss_icon = tag.span "&times;".html_safe, "aria-hidden" => "true"
      close_button = tag.button dismiss_icon, type: "button", class: "close ml-2", "aria-label" => "Close", data: { dismiss: "alert" }

      Array(message).each do |msg|
        message = tag.span msg.html_safe
        text = content_tag(:div, message + close_button, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
