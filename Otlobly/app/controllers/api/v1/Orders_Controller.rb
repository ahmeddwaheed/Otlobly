module Api
	module V1
		class OrdersController < ApplicationController
			def index 
				orders = Order.order(:created_at)
				render json: {status: 'SUCCESS', message: 'Loaded Orders', data: orders}, status: :ok
			end

			def show 
				order = Order.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Restaurant', data: order}, status: :ok
			end

			def menus 
				order = Order.find(params[:id]).menus.collect
				render json: {status: 'SUCCESS', message: 'Loaded Orders Menus', data: order}, status: :ok
			end

			def create 
				order = Order.new(order_params)

				if(order.save)
					render json: {status: 'SUCCESS', message: 'Saved Restaurant', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Order not saved', data: order.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				order = Restaurant.find(params[:id])
				order.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Order', data: order}, status: :ok				
			end

			def update 
				order = Restaurant.find(params[:id])

				if order.update(order_params)
					render json: {status: 'SUCCESS', message: 'Updated Order', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Restaurant not updated', data: order.errors}, status: :unprocessable_entity
				end
			end

			private

			def order_params
				params.permit(:user_id)
			end
		end
	end
end