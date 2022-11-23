Rails.application.routes.draw do
  root to:"homes#top"
  devise_for :users
  resources :users, only:[:show, :ed]
  resources :books
end  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmend
