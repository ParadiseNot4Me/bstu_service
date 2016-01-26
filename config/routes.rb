BstuService::Application.routes.draw do
 namespace :api do
    namespace :v1 do
       post '/registration' => 'user#registrtion'
       post '/authorization' => 'user#authorization'
       #resources :registration, only: [:index, :create, :show, :update, :destroy]
    end
  end

end
