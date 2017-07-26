Rails.application.routes.draw do
  resources :links
  root to:  'links#new'
  get ':short_url' => 'links#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
