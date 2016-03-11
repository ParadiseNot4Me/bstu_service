BstuService::Application.routes.draw do
  namespace :api do
    namespace :v1 do


      post '/registration' => 'user#registration'
      post '/authorization' => 'user#authorization'

      get '/approve/users' => 'approve#index'
      post '/approve' => 'approve#approve'

      #СТУДЕНТ
      get '/student/:id' => 'student#show'
      post '/student' => 'student#create'
      put '/student/:id' => 'student#update'
      delete '/student/:id' => 'student#delete'

      #ГРУППА
      get '/groups' => 'group#index'



    end
  end

end
