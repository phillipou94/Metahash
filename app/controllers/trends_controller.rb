class TrendsController < ApplicationController

	def show
  		@current_trend = Trend.find(params[:id])
  		@posts = @current_trend.submissions
  		@topic = @current_trend.topics
  		@current_topic = @current_trend.topics
  	end

end
