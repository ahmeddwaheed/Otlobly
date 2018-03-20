Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do
  		resources :restaurants
  		resources :menus
  		resources :items
      resources :orders
      resources :order_items
		  get 'restaurant_menus/:id' => "restaurants#menus"
		  get 'menu_items/:id' => "menus#items"
      get 'restaurant_items/:id' => "restaurants#items"
      get 'cart/:id' => "orders#viewcart"
      put 'submit_order/:id' => "orders#submit"
      get 'areas' => "orders#areas"
      get 'submitted_orders' => "orders#submitted_orders"
  	end
  end
 post 'authenticate', to: 'authentication#authenticate'

end
