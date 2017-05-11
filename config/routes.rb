Rails.application.routes.draw do

resources :users, only: [:new, :create, :edit, :update, :destroy]
resources :sessions, only: [:new, :create, :destroy]
#resources :statuses, only: [:new, :create, :edit, :update, :destroy]
#resources :likes, only: [:create, :destroy]

root 'welcome#index'
get "log_out" => "sessions#destroy", :as => "signout"
get "log_in" => "sessions#new", :as => "log_in"

end
