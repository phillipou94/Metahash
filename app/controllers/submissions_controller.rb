class SubmissionsController < ApplicationController

  def create
    @submission = current_user.submissions.build(submission_params)
    @submission.topic_id = params[:topic_id]
    @link = Link.create(params[:submission][:link].permit(:url))
    @submission.postable = @link
    @current_topic = Topic.find(@submission.topic_id)

    if @submission.save
      # @submission.update_score
      redirect_to @current_topic
      flash[:success] = "Post submitted!"
    else
      @link.destroy
      redirect_to @current_topic
    end
  end


  private
  def submission_params
    params.require(:submission).permit(:content)
  end

end
