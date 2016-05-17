class Api::V1::UserController < Api::V1::Base::BaseController

  def registration
    if !(User.find_by login: post_params[:login])
      @user = User.new(post_params)

      student = Student.find_by record_book_number: params[:record_book_number]
      if student
        @user.student = student
        notify_steward()
        @user.save

        render( json: {:status => "Пользователь успешно создан" })
      else
        rescue_access_denied("Студент с указанным номером зачетки не существует")
      end
    else
      rescue_access_denied("Пользователь с таким логином уже существует")
    end

  end

  def authorization
    user = User.find_by login: post_params[:login], password: Digest::MD5.hexdigest(post_params[:password])
    if user

      token = SecureRandom.base64(64)

      hash = Hashs.new(token: token,user_id: user.id)
      hash.save;

      render(json:  { :access_token => token })
    else

      rescue_access_denied("Пользователя с таким логином и паролем не существует")
    end
  end

  def show

    Spawnling.new do
      if( $running == true)
         logger.info("already running")
        return
      end
      $running = true
      logger.info("I feel sleepy...")
      sleep 11
      logger.info("Time to wake up!")
      $running = false
    end

    if !params['token']
      rescue_bad_request("token")
    else
      hash = Hashs.find_by token: params['token']
      if hash
        @user = hash.user
      else
        rescue_unauthorized("Ошибка токена")
      end
    end

    render json: @user


  end


  def post_params
    params.permit(:login, :password)
  end

  private

  def notify_steward
    group = @user.student.group
    if @stewards
      @stewards = Steward.find_by group_id: group.id
      @user.stewards
      @stewards.users << @user
    end
  end
end
