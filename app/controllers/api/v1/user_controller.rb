class Api::V1::UserController < Api::V1::BaseController

	def registration
		if !(User.find_by login: post_params[:login])
			user = User.new(post_params)

			student = Student.find_by record_book_number: params[:record_book_number]
			if student
				user.student = student;
				user.save;
				render(json: user)
			else
				render(json: post_params)
			#номер зачетки неверный
			end
		else
		#пользователь с таким логином существует
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
end
