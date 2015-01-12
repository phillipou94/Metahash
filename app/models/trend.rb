class Trend < ActiveRecord::Base
	has_many :submissions
	validates :title, uniqueness: true


end