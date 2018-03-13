
module FormHelper
  # custom error message
  def error_message(form, field)
    if form.object.errors[field].present?
      error_messsage =  form.object.errors[field].try(:first).to_s
      content_tag(:div, error_messsage, class: 'help-inline')
    end
 end
end
