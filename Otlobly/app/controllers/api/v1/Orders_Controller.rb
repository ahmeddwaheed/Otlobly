module Api
	module V1
		class OrdersController < ApplicationController
			def index 
				orders = Order.order(:created_at)
				render json: {status: 'SUCCESS', message: 'Loaded Orders', data: orders}, status: :ok
			end

			def show 
				order = Order.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Order', data: order}, status: :ok
			end

			def viewcart
				order = Order.find(params[:id]).order_items.collect
				items = Array.new
				order.each do |item|
					order_item = {details: Item.find(item.id), quantity: item.quantity}
					items.push order_item
				end
				cart = {items: items, total: Order.find(params[:id]).total}
				render json: {status: 'SUCCESS', message: 'Loaded Order', data: cart}, status: :ok
			end

			def create 
				order = Order.new(order_params)

				if(order.save)
					render json: {status: 'SUCCESS', message: 'Saved Order', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Order not saved', data: order.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				order = Order.find(params[:id])
				order.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Order', data: order}, status: :ok				
			end


			def update 
				order = Order.find(params[:id])

				if order.update(order_params)
					render json: {status: 'SUCCESS', message: 'Updated Order', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Order not updated', data: order.errors}, status: :unprocessable_entity
				end
			end

			private

			def order_params
				params.permit(:user_id,:order_id,:quantity,:item_id)
			end
		end
	end
end