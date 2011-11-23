SampleTodo::Application.routes.draw do
  resources :todos, :only => [:index, :create, :show, :edit, :new] do
    put :finish, :on => :member
    put :unfinish, :on => :member
    get :done, :on => :collection
  end

  get "home/index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root :to => "home#index"
end
