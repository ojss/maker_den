require 'test_helper'

class TopicsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:nova)
    @topic = @user.topics.build(link: 'https://www.google.com',
                                description: 'a'*140,
                                pageTitle: ';alskda;lskd')
  end

  test "should redirect if user is not logged in" do
    get new_topic_path
    assert_redirected_to root_url
    assert_not flash.empty?
  end

  test "should open new topics page if user is logged in" do
    log_in_as @user
    get new_topic_path
    assert_template 'topics/new'
  end

  test "should create a new post if user is logged in" do
    log_in_as @user
    get new_topic_path
    assert_template 'topics/new'

    assert_difference 'Topic.count', 1 do
      post topics_path, topic: {
          link: 'https://www.google.com',
          description: 'A'*141,
          pageTitle: 'This is a test'
      }
    end
    assert_redirected_to topics_url
  end

  test "should delete a post if user matches" do
    log_in_as @user
    get new_topic_path
    assert_template 'topics/new'

    assert_difference 'Topic.count', 1 do
      post topics_path, topic: {
          link: 'https://www.google.com',
          description: 'A'*141,
          pageTitle: 'This is a test'
      }
    end
    topic = assigns(:topic)
    assert_difference 'Topic.count', -1 do
      delete topic_path(topic)
    end
    assert_not flash.empty?
    assert flash[:danger] == "Post has been successfully deleted"
  end
end
