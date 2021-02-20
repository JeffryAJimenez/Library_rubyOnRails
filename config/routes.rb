Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :comments
  end
  post '/checkout/:id' => 'books#checkout', :as => 'checkout'
  get 'search', to: 'books#search'
  get 'patron/books', to: 'books#patron_index'
  get 'patron/search', to: 'books#patron_search'
  get 'welcome/index'
  root 'welcome#index'

end
