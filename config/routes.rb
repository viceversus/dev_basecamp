DevBasecamp::Application.routes.draw do
  root :to => 'users#show'

  devise_for :users

  match '/users/:username' => 'users#show', :as => :user

  resources :projects
end
