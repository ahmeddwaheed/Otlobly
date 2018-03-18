module Api
	module v1
		class RestaurantsController < ApplicationController
			def index 
				restaurants = Restaurant.findAll()
				render json :{status: 'SUCCESS', message: 'Loaded Restaurants', data: restaurants}
			end
		end
	end
end