Rails.application.routes.draw do
  root "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  post 'import_products_to_solr', to: 'pages#import_products_to_solr'
  get 'search', to: 'search#index'
  get 'search/results', to: 'search#results'
  get 'solr_import', to: 'solr_import#index', as: :solr_import_index
  post 'solr_import/import_productlines_text_description', to: 'solr_import#import_productlines_text_description', as: :import_productlines_text_description
end
