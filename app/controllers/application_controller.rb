class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def load_trends
    @trends = Twitter.trends(id=1, options={}) # For this demonstration lets keep the tweets limited to the first 5 available.
  end

end
