module ApplicationHelper
  ActionView::Base.default_form_builder = BetterForms

  def get_date date
    date_response = date.created_at.to_formatted_s(:db)
    return "#{date_response}"
  end
end
