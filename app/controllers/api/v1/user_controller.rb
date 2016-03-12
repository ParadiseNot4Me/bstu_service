class Api::V1::UserController < Api::V1::Base::BaseController

  def registration
    if !(User.find_by login: post_params[:login])
      @user = User.new(post_params)

      student = Student.find_by record_book_number: params[:record_book_number]
      if student
        @user.student = student
        notify_steward()
        @user.save

        render(json: {:status => "Пользователь успешно создан"})
      else
        render(json: {:error => "Студент с указанным номером зачетки не существует"})
      end
    else
      render(json: {:error => "Пользователь с таким логином уже существует"})
    end

  end


  def authorization
    user = User.find_by login: post_params[:login], password: Digest::MD5.hexdigest(post_params[:password])
    if user

      token = SecureRandom.base64(64)

      hash = Hashs.new(token: token,user_id: user.id)
      hash.save;

      render(json:  { :access_token => token })
    end
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
