Rails.application.routes.draw do

	root 'restaurant_types#index'

	resources :restaurants, only: [:index, :show] do
		resources :menus, only: [:index, :show]
	end


	namespace :admin do
		resources :restaurants, only: [:new, :create, :edit, :update] do
			resources :menus, only: [:new, :create, :edit, :update]
			resources :orders do
				resources :order_items
			end
		end
	end

end
