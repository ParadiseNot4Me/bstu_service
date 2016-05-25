BstuService::Application.routes.draw do
  ActiveAdmin.routes(self)

  get '/authentication' => 'authentication#index'
  post '/authentication_path' => 'authentication#authentication'

  namespace :api do
    namespace :v1 do


      post '/registration' => 'user#registration'
      post '/authorization' => 'user#authorization'
      get '/user' => 'user#show'

      get '/approve/users' => 'approve#index'
      post '/approve' => 'approve#approve'

      #СТУДЕНТ
      get '/student/:id' => 'student#show'
      post '/student' => 'student#create'
      put '/student/:id' => 'student#update'
      delete '/student/:id' => 'student#delete'

      #ГРУППА
      get '/groups' => 'group#index'

      #РАСПИСАНИЕ
      get '/schedule' => 'schedule#schedule'
      get '/schedule_of_day' => 'schedule#schedule_of_day'

      #Апи успеваемости
      get '/progress' => 'progress#show'
      put '/progress/update' => 'progress#update'

      get '/finally' => 'finally#show'
      put '/finally' => 'finally#update'

      get '/teacher/subjects' => 'teacher#subjects'

    end
  end

end
