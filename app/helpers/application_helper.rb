module ApplicationHelper
  def page_title
    title = "Tsuxi"
    title = @page_title + " | " + title if @page_title

    return title
  end
end
