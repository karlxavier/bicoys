Rails.application.routes.draw do

	root 'restaurant_types#index'

  	devise_for :admins, controllers: { 
			  		registrations: "admins/registrations",
			  		sessions: "admins/sessions"
			  	} do
	end

	devise_for :users, controllers: { 
		omniauth_callbacks: 'users/omniauth_callbacks',
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    # devise_scope :user do
    # 	get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    # 	get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
    # end

    devise_for :restos, controllers: {
    	sessions: 'restos/sessions',
    	registrations: 'restos/registrations'
    }

    resources :order_items
    resources :orders, only: [:index] do
    	member do
    		get 'checkout'
    	end
    end

    resources :restaurant_types, only: [:show]

	resources :restaurants, only: [:index, :show] do
		resources :menus, only: [:index, :show]
		member do
			get 'user_location'
			get 'change_user_location'
			# get 'set_user_location'
		end
	end

	resources :user_addresses, only: [:edit, :update]
	resources :suggest_restos, only: [:new, :create]
	
	get 'err_404', :to => 'errors#err_404', :as => :err_404
	get 'set_user_location', :to => 'restaurants#set_user_location', :as => :set_user_location
	get 'user_location', :to => 'restaurant_types#user_location', :as => :user_location
	get 'about_us', to: 'mains#about_us', as: :about_us
	get 'faq', to: 'mains#faq', as: :faq

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

	get '*path' => redirect('/') # FOR PAGES NOT FOUND REDIRECT TO ROOT_PATH

end
