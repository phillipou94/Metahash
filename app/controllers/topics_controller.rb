class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def index
    @topics = Topic.all
  end


  def create
    @new_topic = Topic.new(topic_params)
    @new_topic.trend_id = params[:trend_id]
    @new_topic.user_id = current_user.id 
   # @current_trend = Trend.find(@new_topic.trend_id)
    if @new_topic.save
      flash[:success] = "New Topic Created"
      redirect_to root_path
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
    params.require(:topic).permit(:title, :summary, :trending_reason)
  end

end
