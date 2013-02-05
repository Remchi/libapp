module ApplicationHelper

  def top_menu
    #result = content_tag(:ul, class: "nav pull-left") do
    #  content_tag(:li, link_to("Books", books_path))
    #end

    result = ""
    result += content_tag(:ul, class: "nav pull-right") do
      if current_user
        items = content_tag(:li, link_to("Welcome, #{current_user.email}", root_path))
        items += tag(:li, class: "divider-vertical")
        items += content_tag(:li, link_to("Logout", logout_path))
      else
        items = content_tag(:li, link_to("Register", register_path))
        items += tag(:li, class: "divider-vertical")
        items += content_tag(:li, link_to("Login", login_path))
      end
      items
    end

    result
  end

end
