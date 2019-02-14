Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
	post 'create_qrcode', to: 'users#create_qrcode'
	post 'log_in', to: 'users#log_in'
	post 'log_out', to: 'users#log_out'
	resources :users
	resources :cases
	root 'welcome#index'
end
