module ApplicationHelper

  def top_menu
    content_tag(:div, id: "top-menu") do
      if current_user
        "Welcome, #{current_user.email}"
      else
        link_to "Register", register_path
      end
    end
  end

end
