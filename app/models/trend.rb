class Trend < ActiveRecord::Base
	has_many :submissions, dependent: :destroy
	has_many :topics, dependent: :destroy
	validates :title, uniqueness: true

	def self.search(query)
  		where("title like ?", "%#{query}%") 
	end


end