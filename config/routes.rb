Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
	post 'create_qrcode', to: 'users#create_qrcode'

   resources :users
   root 'welcome#index'
end
