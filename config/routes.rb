DevBasecamp::Application.routes.draw do
  get "users/show"

  root :to => 'users#show'

  devise_for :users
  scope "/dbc" do
    resources :users
  end
end
