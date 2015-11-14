# Enables inline error rendering in forms.
#
# + errors
#
class BetterForms < ActionView::Helpers::FormBuilder
  def errors(name)
    if (e = @object.errors[name])
      @template.content_tag(:div, e.join(', ').capitalize, class: 'form-error')
    end
  end
end
