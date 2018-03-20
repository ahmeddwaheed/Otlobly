Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do
  		resources :restaurants
  		resources :menus
		get 'mymenus/:id' => "restaurants#menus"
  	end
  end
 post 'authenticate', to: 'authentication#authenticate'

end
