# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'
resources :secrets, only: [:index, :new, :create, :destroy]
resources :sessions, only: [:new, :create]
delete 'sessions', to: 'sessions#destroy', as: :session
