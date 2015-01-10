require "twitter"
class StaticPagesController < ApplicationController
	def home

		client = Twitter::REST::Trends
  		#@trends =client.trends(id=1, options={})

		@topics = Topic.all.paginate(page: params[:page])
  end


	def help

	end

end
