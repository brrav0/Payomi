module ApplicationHelper

  def full_title(page_title = '')
  base_title = "Payomi"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end 

end
