Rails.application.routes.draw do
 
  resources :songs, only: [:index,:show,:new,:edit,:create,:update,:delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
