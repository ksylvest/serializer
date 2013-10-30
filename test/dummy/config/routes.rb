Dummy::Application.routes.draw do

  root :to => "main#index"

  resources :users

end
