# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }

root to: 'home#index'
get '/secrets', to: 'secrets#index'
get '/secrets/new', to: 'secrets#new'
post '/secrets', to: 'secrets#create'
