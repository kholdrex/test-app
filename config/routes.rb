Rails.application.routes.draw do
  root to: 'home#index'

  get '/news', to: 'home#index'

  mount GrapeSwaggerRails::Engine => '/api/swagger'
  mount API::Root => '/'
end
