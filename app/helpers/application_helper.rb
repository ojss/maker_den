module ApplicationHelper
  def full_title(title='')
    base_title = 'MakerDen'
    if title.empty?
      base_title
    else
      "#{title} | #{base_title}"
    end
  end
end
