module Api
	module V1
		class RestaurantsController < ApplicationController
			def index 
				restaurants = Restaurant.order(:name)
				render json: {status: 'SUCCESS', message: 'Loaded Restaurants', data: restaurants}, status: :ok
			end

			def show 
				restaurant = Restaurant.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Restaurant', data: restaurant}, status: :ok
			end

			def menus 
				restaurant = Restaurant.find(params[:id]).menus.collect
				render json: {status: 'SUCCESS', message: 'Loaded Restaurants Menus', data: restaurant}, status: :ok
			end

			def create 
				restaurant = Restaurant.new(restaurant_params)

				if(restaurant.save)
					render json: {status: 'SUCCESS', message: 'Saved Restaurant', data: restaurant}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Restaurant not saved', data: restaurant.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				restaurant = Restaurant.find(params[:id])
				restaurant.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Restaurant', data: restaurant}, status: :ok				
			end

			def update 
				restaurant = Restaurant.find(params[:id])

				if restaurant.update(restaurant_params)
					render json: {status: 'SUCCESS', message: 'Updated Restaurant', data: restaurant}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Restaurant not updated', data: restaurant.errors}, status: :unprocessable_entity
				end
			end

			private

			def restaurant_params
				params.permit(:name,:id)
			end
		end
	end
end