ProviderStore::Application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  namespace :rest do
    resources :provider_types, :only => [:index, :show] do
      resources :providers, :only => [:index, :show]
    end

    resources :fetchers, :only => [:index, :show] do
      resources :providers, :only => [:index, :show]
      resources :supplies, :only => [:index, :show]
    end

    resources :deliver_periods, :only => [:index, :show] do
      resources :fetchers, :only => [:index, :show]
    end

    resources :retains, :only => [:index, :show] do
      resources :fetchers, :only => [:index, :show]
    end

    resources :transports, :only => [:index, :show] do
      resources :fetchers, :only => [:index, :show]
    end

    resources :statuses, :only => [:index, :show] do
      resources :fetchers, :only => [:index, :show]
    end

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
      resources :ipaddresses, :only => [:index, :show]
    end

    resources :supplies, :only => [:index, :show] do
      resources :fetchers, :only => [:index, :show]
    end

    resources :users, :only => [:index, :show]
  end

  match 'rest/providercode/:code' => 'rest/providers#code'

  resources :consumers, :only => [:index, :show]

  root :to => "consumers#index"

  get "home/index"
end
