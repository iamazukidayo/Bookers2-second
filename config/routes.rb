Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  # get 'book_comments/create'
  # get 'book_comments/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  devise_for :users
  get "home/about"=>"homes#about"
  get "search" => "searches#search"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorite, only:[:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update,:create] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end
