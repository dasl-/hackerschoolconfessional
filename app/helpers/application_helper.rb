module ApplicationHelper
  def render_pusher_key
  	if Rails.env.production?
  	  return "'a3858e72333922ce04f6'"
  	else
      return "'3959abe8b63fee2973a9'"
    end
  end
end
