Promosacian::Application.routes.draw do
  devise_for :admins, :path => "admins", :path_names => { :sign_in => 'ingresar', :sign_out => 'salir', :password => 'secreto', :confirmation => 'verificacion', :unlock => 'desbloquear', :registration => 'registro', :sign_up => 'inscribirse' }
  authenticated :admin do
    root :to => 'contactos#index'
  end

  resources :contactos

  root :to => 'contactos#new'
end
