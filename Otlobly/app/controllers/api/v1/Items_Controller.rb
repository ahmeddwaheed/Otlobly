module Api
	module V1
		class ItemsController < ApplicationController
			def index 
				items = Item.order(:name)
				render json: {status: 'SUCCESS', message: 'Loaded Items', data: items}, status: :ok
			end

			def show 
				item = Item.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Item', data: item}, status: :ok
			end


			def create 
				item = Item.new(items_params)

				if(item.save)
					render json: {status: 'SUCCESS', message: 'Saved Item', data: item}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Item not saved', data: item.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				item = Item.find(params[:id])
				item.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Item', data: item}, status: :ok				
			end

			def update 
				item = Item.find(params[:id])

				if item.update(items_params)
					render json: {status: 'SUCCESS', message: 'Updated Item', data: item}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Item not updated', data: item.errors}, status: :unprocessable_entity
				end
			end

			private

			def items_params
				params.permit(:name,:description,:price, :menu_id)
			end
		end
	end
end