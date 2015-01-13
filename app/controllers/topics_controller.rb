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
    @submission = current_user.submissions.build if logged_in?
    @link = Link.new
    @user = current_user
    @submissions = @topic.submissions.paginate(page: params[:page])
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :summary, :trending_reason, :imageURL)
  end

end
