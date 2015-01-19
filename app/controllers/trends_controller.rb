class TrendsController < ApplicationController

	def show
  		@current_trend = Trend.find(params[:id])
  		@posts = @current_trend.submissions
  		@topic = @current_trend.topics
  		@current_topic = @current_trend.topics
  end

  def index
  		if params[:search]
  			search_parameter = params[:search].delete '#'
    		@search_result = Trend.search(search_parameter).order("created_at ASC").first
    		if @search_result
    			redirect_to trend_path(@search_result.id)
    		else
    			@all_trends = Trend.all.order('created_at DESC')
    			## perform a paginated query:
				@all_trends = Trend.paginate(:page => params[:page])
				# or, use an explicit "per page" limit:
				Trend.paginate(:page => params[:page], :per_page => 30)

    		end
    	else
    		@all_trends = Trend.all.order('created_at DESC')
    			## perform a paginated query:
			@all_trends = Trend.paginate(:page => params[:page])
				# or, use an explicit "per page" limit:
			Trend.paginate(:page => params[:page], :per_page => 30)


  		end
	end


end
