Rails.application.routes.draw do
  get 'books/top'
  root to:"homes#top"
end  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmend
