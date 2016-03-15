require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:nova)
    @topic = @user.topics.build(link: 'https://www.google.com',
                                description: 'a'*140,
                                pageTitle: ';alskda;lskd')
  end

  test "everything is valid" do
    assert @topic.valid?
  end

  test "should not accept invalid link" do
    @topic.link = 'news.ycombinator.co!!m'
    assert_not @topic.valid?
  end

  test "pageTitle should not be empty" do
    @topic.pageTitle = ''
    @topic.save!

    @topic.reload
    assert_not @topic.pageTitle.empty?
  end

  test "link should not be empty" do
    @topic.link = ''
    assert_not @topic.valid?
  end

  test "description should be 140 chars long" do
    @topic.description = "a" * 13
    assert_not @topic.valid?
  end

end
