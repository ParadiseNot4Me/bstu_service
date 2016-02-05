BstuService::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/registration' => 'user#registration'
      post '/authorization' => 'user#authorization'
      get '/approve/users' => 'approve#index'
      #resources :registration, only: [:index, :create, :show, :update, :destroy]
    end
  end

end
