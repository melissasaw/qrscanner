class UsersController < ApplicationController

	def index
	end

	def create_qrcode
		byebug
		@qr = RQRCode::QRCode.new( qr_code_params[:text], size: 4)
	end

private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end
end
