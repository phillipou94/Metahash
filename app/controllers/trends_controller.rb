class TrendsController < ApplicationController

	def show
  		@trend = Trend.find(params[:id])

	end 

end
