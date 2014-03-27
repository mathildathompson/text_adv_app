module DeviseHelper
  # Incorporated this to allow customisation of devise error messages. The entire code can be deleted if desired.

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)
    #id="error_explanation" 

    html = <<-HTML
    <div class="row">
      <div class="alert alert-danger col-sm-offset-4 col-sm-4">
        <p><b>Error:</b> #{sentence}</p>
        <ul>#{messages}</ul>
      </div>
    </div>
    <br>
    HTML

    html.html_safe
  end
end