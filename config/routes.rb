Scopes::Application.routes.draw do
  get 'products/available' => 'products#available', :as => 'available_products'
  get 'products/unavailable' => 'products#unavailable', :as => 'unavailable_products'
  resources :products
  root :to => 'products#index'
end
