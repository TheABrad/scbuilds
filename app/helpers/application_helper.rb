module ApplicationHelper
  
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
	"alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    markdown = Redcarpet::Markdown.new(renderer, :autolink => true)
    markdown.render(text).html_safe
  end
end
