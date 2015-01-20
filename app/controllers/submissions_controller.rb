require 'uri'
class SubmissionsController < ApplicationController

  def create
    @submission = current_user.submissions.build(submission_params)
    @submission.trend_id = params[:trend_id]
    @link = Link.create(params[:submission][:link].permit(:url))
    @submission.postable = @link

    @current_trend = Trend.find(@submission.trend_id)
    uri = URI.parse(@link.url)
    if !uri.kind_of?(URI::HTTP)
      @submission.postable.url = ""
    end

    #@current_topic = Topic.find(@submission.topic_id)
    if @submission.save
      # @submission.update_score
      redirect_to @current_trend
      flash[:success] = "Post submitted!"
    else
      @link.destroy
      redirect_to @current_trend
      #@submissions = @current_topic.submissions.paginate(page: params[:page])
      #render 'topics/show'
    end
  end



  private
  def submission_params
    params.require(:submission).permit(:content, :title)
  end

end
