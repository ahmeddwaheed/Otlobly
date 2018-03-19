module Api
	module V1
		class RestaurantsController < ApplicationController
			def index 
				restaurants = Restaurant.order(:name)
				render json: {status: 'SUCCESS', message: 'Loaded Restaurants', data: restaurants}, status: :ok
			end
		end
	end
end