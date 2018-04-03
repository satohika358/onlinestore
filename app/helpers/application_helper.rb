# require 'datatables'

module ApplicationHelper
  # include Datatables::Helpers
  def render_if(condition, record)
    if condition
      render record
    end
  end
end
