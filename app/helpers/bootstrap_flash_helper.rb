# BootstrapFlashHelper
# + bootstrap_flash
#
module BootstrapFlashHelper
  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"),
                                       :class => "close",
                                       :"data-dismiss" => "alert") +
                           msg, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end

    flash_messages.join("\n").html_safe
  end
end
