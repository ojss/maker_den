class Topic < ActiveRecord::Base
  require 'uri'
  belongs_to :user
  before_save :get_page_title

  default_scope -> { order(:created_at => :desc) }

  VALID_LINK_REGEX = URI.regexp

  validates :link,
            presence: true,
            format: {with: VALID_LINK_REGEX}
  validates :description,
            presence: true,
            length: {minimum: 50}


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
