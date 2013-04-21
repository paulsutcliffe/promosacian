Promosacian::Application.routes.draw do
  devise_for :admins

  resources :contactos

  root :to => 'contactos#new'
end
