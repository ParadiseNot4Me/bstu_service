class Api::V1::UserController < Api::V1::BaseController

	def registration
		if !(User.find_by login: post_params[:login])
			user = User.new(post_params)
			user.save;
			render(json: post_params)
		else
		
		end

	end


	def authorization

		user = User.find_by login: post_params[:login], password: Digest::MD5.hexdigest(post_params[:password])
		if user

		    token = SecureRandom.base64(64)

		    hash = Hashs.new(token: token,user_id: user.id)
		    hash.save;

		    render(json: token)
		end
	end



	def post_params
      		params.permit(:login, :password)
    end
end
