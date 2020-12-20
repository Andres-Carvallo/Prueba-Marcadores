Rails.application.routes.draw do
  get '/apis/news' => 'apis#news'
  resources :urls
  resources :sub_categories
  resources :categories
  resources :bookmarks
  root 'sub_categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
