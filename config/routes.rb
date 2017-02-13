Rails.application.routes.draw do

  	devise_for :admins, controllers: { 
			  		registrations: "admins/registrations",
			  		sessions: "admins/sessions"
			  	} do
		# get '/admins/sign_out' => 'admins/sessions#destroy'
	end

	root 'restaurant_types#index'

	devise_for :users, controllers: {
        sessions: 'users/sessions'
    }


	resources :restaurants, only: [:index, :show] do
		resources :menus, only: [:index, :show]
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
	end

end
