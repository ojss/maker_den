class Topic < ActiveRecord::Base
  belongs_to :user
  before_save :get_page_title

  VALID_LINK_REGEX = /(?:https?:\/\/)?(?:[\w]+\.)(?:\.?[\w]{2,})+$\z/i

  validates :link,
            presence: true,
            format: {with: VALID_LINK_REGEX}
  validates :description,
            presence: true,
            length: {minimum: 14}


  private
  def get_page_title
    if self.pageTitle.blank?
      open(self.link) do |f|
        doc = Nokogiri::HTML(f)
        self.update_attribute(:pageTitle, doc.at_css('title').text)
      end
    end
  end
end
