class Brewery < ActiveRecord::Base
  include RatingAverage

	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers

	validates :name, length: { minimum: 1 }
	validates :year, numericality: { greater_than_or_equal_to: 1042,
					less_than_or_equal_to: 2014,
                                        only_integer: true }

	def print_report
    		puts name
    		puts "established at year #{year}"
    		puts "number of beers #{beers.count}"
    		puts "number of ratings #{ratings.count}"
	end

end
