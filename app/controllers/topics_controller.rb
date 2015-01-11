class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "New Topic Created"
      redirect_to @topic
    else
      render 'new'
    end
  end


  def show
    @topic = Topic.find(params[:id])
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :summary, :trending_reason)
  end

end