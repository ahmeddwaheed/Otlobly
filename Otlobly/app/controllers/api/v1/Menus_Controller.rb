module Api
	module V1
		class MenusController < ApplicationController
			def index 
				menus = Menu.order(:title)
				render json: {status: 'SUCCESS', message: 'Loaded Menus', data: menus}, status: :ok
			end

			def show 
				menu = Menu.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded menu', data: menu}, status: :ok
			end

			def create 
				menu = Menu.new(menus_params)

				if(menu.save)
					render json: {status: 'SUCCESS', message: 'Saved Menu', data: menu}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Menu not saved', data: menu.errors}, status: :unprocessable_entity
				end
			end

			def destroy
				menu = Menu.find(params[:id])
				menu.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Menu', data: menu}, status: :ok				
			end

			def update 
				menu = Menu.find(params[:id])

				if menu.update(menus_params)
					render json: {status: 'SUCCESS', message: 'Updated Menu', data: menu}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Menu not updated', data: menu.errors}, status: :unprocessable_entity
				end
			end

			private

			def menus_params
				params.permit(:title,:description,:restaurant_id)
			end
		end
	end
end