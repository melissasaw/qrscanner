class UsersController < ApplicationController

	def index
	end

	def create_qrcode
		byebug
		@qr = RQRCode::QRCode.new( qr_code_params[:text], size: 4)
	end

	def new
		@user=User.new
	end

	def create
		byebug
		user= User.new(get_params)

		if user.save
			redirect_to root_path
		else 
			flash[:info] = "Whoopss, something went wrong. User was not created!"
			render template: "/users/new"
		end	
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

end
