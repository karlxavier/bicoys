Rails.application.routes.draw do

	root 'restaurant_types#index'

  	devise_for :admins, controllers: { 
			  		registrations: "admins/registrations",
			  		sessions: "admins/sessions"
			  	} do
		# get '/admins/sign_out' => 'admins/sessions#destroy'
	end

	devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    devise_for :restos, controllers: {
    	sessions: 'restos/sessions',
    	registrations: 'restos/registrations'
    }


	resources :restaurants, only: [:index, :show] do
		resources :menus, only: [:index, :show]
	end

	namespace :restos do
		get '/', to: 'restaurants#dashboard', as: ''
		resources :restaurants, only: [:index, :edit, :update] do
			resources :menus
			resources :menu_categories
		end
	end


	namespace :admins do
		get '/', to: 'restaurants#dashboard', as: ''
		resources :restaurants, only: [:index, :new, :create, :edit, :update] do
			resources :menus, only: [:new, :create, :edit, :update]
			resources :orders do
				resources :order_items
			end
		end
		resources :restaurant_images, only: [:create, :destroy]
		resources :users, only: [:index, :edit, :update]
		resources :restos, only: [:index, :edit, :update]
	end

end
