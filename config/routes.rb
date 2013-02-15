WantedList::Application.routes.draw do
	resources :users
	
	root :to => 'pages#home'
	
	match '/signup', to: 'users#new'
end
