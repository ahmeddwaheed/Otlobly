# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.3.3

* Rails version: 5.1.5

* Api Consumtion:

	* /api/v1

		* Authenticate user: /authenticate, POST, must give email and password as parameters

		* View restaurant menus: /restaurant_menus, GET, must give id of restaurant as parameter

		* View menu items: /menu_items, GET, must give id of restaurant as parameter

		* View all items in a restaurant per menu: /restaurant_items, GET, must give id of restaurant

		* View Cart: /cart, GET, must give id of cart as parameter

		* Submit Order:, /submit_order, PUT, must give order id as parameter

		* Get all areas currently being delivered, GET, /areas, 

		* Get All Submitted Orders, /submitted_orders, GET

		* BREAD:

			* /restaurants
			* /menus
			* /items
			* /orders
			* /order_items




