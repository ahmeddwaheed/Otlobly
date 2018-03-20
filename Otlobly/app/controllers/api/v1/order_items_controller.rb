module Api
	module V1
		class OrderItemsController  < ApplicationController
			def index 
				orderitems = OrderItem.order(:created_at)
				render json: {status: 'SUCCESS', message: 'Loaded OrderItems', data: orderitems}, status: :ok
			end

			def show 
				orderitem = OrderItem.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded OrderItem', data: orderitem}, status: :ok
			end

			def create 
				orderitem = OrderItem.new(orderitem_params)

				if(orderitem.save)
					render json: {status: 'SUCCESS', message: 'Saved OrderItem', data: orderitem}, status: :ok
				else
					render json: {status: 'ERROR', message: 'OrderItem not saved', data: orderitem.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				orderitem = OrderItem.find(params[:id])
				orderitem.destroy
				render json: {status: 'SUCCESS', message: 'Deleted OrderItem', data: orderitem}, status: :ok				
			end

			def update 
				orderitem = OrderItem.find(params[:id])

				if orderitem.update(orderitem_params)
					render json: {status: 'SUCCESS', message: 'Updated OrderItem', data: orderitem}, status: :ok
				else
					render json: {status: 'ERROR', message: 'OrderItem not updated', data: orderitem.errors}, status: :unprocessable_entity
				end
			end

			private

			def orderitem_params
				params.permit(:order_id,:quantity,:item_id)
			end
		end
	end
end