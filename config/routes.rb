Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  devise_for :users

  root to: "amiibos#index"

  resources :about, only: :index
  resources :amiibos, only: [:index, :show] do
    collection do
      get "search"
    end
  end


  resources :amiibo_series, only: [:index, :show]
  resources :game_series, only: [:index, :show]
  resources :characters, only: [:index, :show]

  resources :cart, only: [:create, :destroy]

  #checkout
  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
    post "review", to: "checkout#review", as: "checkout_review"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
