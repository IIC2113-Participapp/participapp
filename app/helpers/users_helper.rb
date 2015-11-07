# UsersHelper
# + options_for_periodicity
#
module UsersHelper
  def options_for_periodicity periodicity
    options_for_select([
      ['Cada 1 día', 1],
      ['Cada 2 días', 2],
      ['Cada 5 días', 5],
      ['Cada 7 días', 7],
      ['Cada 10 días', 10],
      ['Cada 14 días', 14]],
      periodicity)
  end
end
