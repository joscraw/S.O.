module ErrorMessageHelper

  def error_message_for(resource, field, options = {:prepend_text => ""})
    error_message = resource.errors[field][0]
    if error_message
      raw "#{options[:prepend_text]} #{error_message}"
    end
  end

end