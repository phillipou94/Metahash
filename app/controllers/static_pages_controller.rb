require "twitter"
class StaticPagesController < ApplicationController
	def home

		client = Twitter::REST::Trends
  		#@trends =client.trends(id=1, options={})

  		access_token = prepare_access_token("2285360612-IYtenRkqB5FYSzUkeElInRRLfvbio8pvkoRASu7", "IfyCV2Ltiw2xQajJcymuu7QIhSOMhB1kL2x63MSMQTTzX")
		# use the access token as an agent to get the home timeline
		data = access_token.request(:get, "https://api.twitter.com/1.1/trends/place.json?id=23424977")

		body = JSON.parse(data.body)
		if body.any?
			trends =body.first["trends"]
			trends.each do |element|
				Trend.new(title:element["name"]).save
			end
			@trends = Trend.last(10)
			@all_trends = Trend.all.order('created_at ASC')

			## perform a paginated query:
			@all_trends = Trend.paginate(:page => params[:page])
			# or, use an explicit "per page" limit:
			Trend.paginate(:page => params[:page], :per_page => 30)


			@topics = Topic.all.paginate(page: params[:page])

			@current_trend = @trends.first

		end
  end


	def help

	end


	# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
	def prepare_access_token(oauth_token, oauth_token_secret)
    	consumer = OAuth::Consumer.new("YNB1bhMpex4y7ERRuCe8hqCA3", "3QezXzBngsbxZgIdJiGXxjZomXFrXLLgULWT8MoFwSDvAJPJcr", { :site => "https://api.twitter.com", :scheme => :header })

    # now create the access token object from passed values
    	token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
    	access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

    return access_token
end

end
