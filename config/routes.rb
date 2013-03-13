ProviderStore::Application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  namespace :rest do
    resources :provider_types, :only => [:index, :show]

    resources :fetchers, :only => [:index, :show] do
      resources :providers, :only => [:index, :show]
      resources :supplies, :only => [:index, :show]
    end

    resources :deliver_periods, :only => [:index, :show]

    resources :retains, :only => [:index, :show]

    resources :transports, :only => [:index, :show]

    resources :statuses, :only => [:index, :show]

    resources :ipaddresses, :only => [:index, :show]

    resources :packages, :only => [:index, :show] do
      resources :consumers, :only => [:index, :show]
      resources :consumers_packages, :only => [:index, :show]
    end

    resources :consumers_providers, :only => [:index, :show]

    resources :consumers_packages, :only => [:index, :show]

    resources :fulltexts, :only => [:index, :show]

    resources :consumers, :only => [:index, :show] do
      resources :providers, :only => [:index, :show]
      resources :packages, :only => [:index, :show]
      resources :consumers_providers, :only => [:index, :show]
      resources :consumers_packages, :only => [:index, :show]
    end

    resources :providers, :only => [:index, :show] do
      resources :consumers, :only => [:index, :show]
      resources :fetchers, :only => [:index, :show]
      resources :packages, :only => [:index, :show]
      resources :consumers_providers, :only => [:index, :show]
    end

    resources :supplies, :only => [:index, :show] do
      resources :fetchers, :only => [:index, :show]
    end

    resources :users, :only => [:index, :show]
  end

  match 'rest/providercode/:code' => 'rest/providers#code'

  root :to => "home#index"

  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
