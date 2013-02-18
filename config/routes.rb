WantedList::Application.routes.draw do	
	root :to => 'pages#home'
	
	resources :users
	resources :items, only: [:new, :create, :destroy]

	resources :sessions, only: [:new, :create, :destroy]

	match '/signup',	to: 'users#new'
	match '/signin',	to: 'sessions#new'
	match '/signout',	to: 'sessions#destroy', via: :delete
end
