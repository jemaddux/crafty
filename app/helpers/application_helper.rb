module ApplicationHelper
  def humanize_number(input)
    input.to_s[0..2].to_f
  end
end
