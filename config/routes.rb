Rails.application.routes.draw do
  devise_for :users
  # devise_for :users do
  #   delete '/users/sign_out' => "devise/sessions#destroy"
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  get '/user' => 'users#show'
  get '/attend' => 'events#attend_event'
  resources :events
end
