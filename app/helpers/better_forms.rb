# Enables inline error rendering in forms.
# + errors
#
class BetterForms < ActionView::Helpers::FormBuilder
  def errors(name)
    if @object.errors[name]
      @template.content_tag(:div, class: 'form-error') do
        @object.errors[name].join(', ').capitalize
      end
    end
  end
end
