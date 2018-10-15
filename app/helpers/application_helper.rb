module ApplicationHelper
  def flash_class(level)
    case level.to_s
      when 'notice', 'success' then 'alert alert-success'
      when 'error', 'alert' then 'alert alert-danger'
    end
  end
end
