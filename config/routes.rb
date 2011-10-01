SampleTodo::Application.routes.draw do
  get "home/index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root :to => "home#index"
end
