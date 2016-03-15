class TopicsController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:new, :create]

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(clean_topic_params)
    if @topic.save
      flash[:success] = "New topic created!"
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong!"
      @feed_items = []
      render 'static_pages/home'
    end
  end


  private
  def clean_topic_params
    params.require(:topic).permit(:link, :description, :pageTitle)
  end
end