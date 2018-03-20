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
				cart = get_order_details(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Cart', data: cart}, status: :ok
			end

			def submit
				order_params = {status: "Confirmed"}
				update_order(order_params)
			end

			def submitted_orders
				orders = Order.where(status: "Confirmed")
				submitted_orders = Array.new
				orders.each do |order|
					params[:id] = order.id
					submitted_orders.push(get_order_details(params[:id]))
				end
				render json: {status: 'SUCCESS', message: 'Loaded Submitted Orders', data: submitted_orders}, status: :ok

			end

			def areas
				orders = Order.find_by_sql("SELECT orders.area FROM orders WHERE orders.status = 'Confirmed'")
				render json: {status: 'SUCCESS', message: 'Loaded Areas', data: orders}, status: :ok
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
				update_order(order_params)
			end

			private

			def order_params
				params.permit(:user_id,:order_id,:quantity,:item_id,:status,:area)
			end

			def update_order(order_params)
				order = Order.find(params[:id])
				if order.update(order_params)
					render json: {status: 'SUCCESS', message: 'Updated Order', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Order not updated', data: order.errors}, status: :unprocessable_entity
				end
			end

			def get_order_details(id)
				order = Order.find(id).order_items.collect
				items = Array.new
				order.each do |item|
					order_item = {details: Item.find(item.id), quantity: item.quantity}
					items.push order_item
				end
				cart = {items: items, total: Order.find(params[:id]).total}
			end
		end
	end
end