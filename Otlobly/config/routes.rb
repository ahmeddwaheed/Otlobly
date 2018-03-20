Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do
  		resources :restaurants
  		resources :menus
  		resources :items
      resources :orders
      resources :order_items
		  get 'mymenus/:id' => "restaurants#menus"
		  get 'myitems/:id' => "menus#items"
      get 'mycart/:id' => "orders#viewcart"
      put 'submitorder/:id' => "orders#submit"
  	end
  end
 post 'authenticate', to: 'authentication#authenticate'

end
