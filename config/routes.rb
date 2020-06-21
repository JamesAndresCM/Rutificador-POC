Rails.application.routes.draw do
  root :to => redirect('/api/v1/search_by_rut')

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'search' => 'search#index'
    end
  end
end
