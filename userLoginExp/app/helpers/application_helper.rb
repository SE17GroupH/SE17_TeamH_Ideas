module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "User Login Experiment for 2017 CSC 510"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
