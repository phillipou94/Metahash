require "twitter"
class StaticPagesController < ApplicationController
	def home

		client = Twitter::REST::Trends
  		#@trends =client.trends(id=1, options={})
  	end


	def help

	end
	
end
