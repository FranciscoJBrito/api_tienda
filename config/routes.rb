Rails.application.routes.draw do

  scope '(:locale)', locale: /es|en/ do 
    get 'home/grettings'
    namespace :v1, defaults: { format: 'json' } do
      resources :users, only: %i[create] do
        post 'login', on: :collection
      end
      resources :stores, only: %i[show]
      resources :products, only: %i[create update]

    end
  end
end
