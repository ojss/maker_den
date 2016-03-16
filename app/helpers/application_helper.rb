module ApplicationHelper
  def full_title(title='')
    base_title = 'MakerDen'
    title.empty? ? base_title : "#{title} | #{base_title}"
  end
end
