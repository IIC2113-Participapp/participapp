# Enables inline error rendering in forms.
#
# + errors
#
class BetterForms < ActionView::Helpers::FormBuilder
  def errors(name)
    if (error = @object.errors[name])
      @template.content_tag(:div, error.join(', ').capitalize,
                            class: 'form-error')
    end
  end
end
