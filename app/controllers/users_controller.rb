class UsersController < ApplicationController
skip_before_action :verify_authenticity_token, :only => [:log_in]

	def index
	end

	# This is the QR code api that sends the request
	def create_qrcode
		@qr = RQRCode::QRCode.new( qr_code_params[:text], size: 4)
	end

	def new
		@user=User.new
	end

	def create
		user= User.new(get_params)

		if user.save
			redirect_to root_path
			flash[:success] = "User successfully created! Log in to continue.."
		else 
			flash[:info] = "Whoopss, something went wrong. User was not created!"
			render template: "/users/new"
		end	
	end

	# Sign in section
	def log_in
		email = signin_params[:email]

		if user = User.find_by(email: email)
			# if email found, then authenticate password
			input_password = signin_params[:password]
			
			if user.authenticate(input_password)
				# create session
				session[:user_id]=user.id
				redirect_to root_path
				flash[:success] = "Successful Log-in"
			else
				flash[:info] ="Wrong password. Please try again."
			end

		else
			redirect_to root_path
			flash[:info] = "Email not found. Please sign up."
		end

		# check existance of email
		# authenticate password
		# create sessions
	end

	def log_out
		
		session[:user_id]=nil
		redirect_to root_path
	end

	def show
	end

	def update
	end

	def destroy
	end

private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end

  def get_params
  	params.require(:user).permit(:first_name, :last_name, :position, :email,:password)
  end

  def signin_params
  	params.permit(:email, :password)
  end

end
