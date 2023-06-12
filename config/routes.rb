Rails.application.routes.draw do
  get 'heaps/show'
  get 'heaps/edit'
  devise_for :users
	# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

	# Defines the root path route ("/")
	root :controller => 'static', :action => :index

  resources :forms, param: :id do
	end

  resources :heaps, param: :id do
    member do
			post :accept
      post :waitlist
      post :reject
		end
	end
end
