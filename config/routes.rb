TestApp3::Application.routes.draw do

  resources :countries
  resources :regions
  resources :cities
  resources :turbazas

  root  'static_pages#home'

end
