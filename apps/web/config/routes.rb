# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage

get "/auth/signout", to: 'session#destroy'
get "/auth/failure", to: 'session#failure'
get "/auth/:provider/callback", to: "session#new"

get "/", to: "home#index"
