class StaticPagesController < ApplicationController
	def home
		@topics = Topic.all.paginate(page: params[:page])
  end

	def help

	end

end
