require "twitter"
class StaticPagesController < ApplicationController
	def home
		if logged_in?
			client = Twitter::REST::Trends
  			#@trends =client.trends(id=1, options={})

  			access_token = prepare_access_token("2285360612-IYtenRkqB5FYSzUkeElInRRLfvbio8pvkoRASu7", "IfyCV2Ltiw2xQajJcymuu7QIhSOMhB1kL2x63MSMQTTzX")
			# use the access token as an agent to get the home timeline
			data = access_token.request(:get, "https://api.twitter.com/1.1/trends/place.json?id=23424977")
		
			body = JSON.parse(data.body)

			@all_posts = Submission.all.paginate(page: params[:page])


			if body
				begin
  				trends =body.first["trends"]
				rescue
  				# .. handle error
				else
  					puts "Congratulations-- no errors!"

					trends =body.first["trends"]
					trends.each do |element|
						Trend.new(title:element["name"]).save
					end 
					@trends = Trend.last(10)
					@topics = Topic.all.paginate(page: params[:page])
					@first_trend = Trend.last
					#show first trend on home page.

			
				ensure
				end 
		 	end 
			#redirect_to trend_path(@first_trend.id)
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
