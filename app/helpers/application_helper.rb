module ApplicationHelper

	def full_title(page_title)
		base_title = "矢上祭出展管理システム"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

end
