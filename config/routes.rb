Confessional::Application.routes.draw do
  resources :comments, only: [:create]
  resources :confessions, only: [:create, :show, :index]

  resources :confessions do
    resources :comments
   end

  root :to => 'confessions#index'
end
