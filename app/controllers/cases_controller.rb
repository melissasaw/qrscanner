class CasesController < ApplicationController

	def index
	end

	def create
		# Creating case that links to the user directly
		# Given case type and serial number
		@case=current_user.cases.new(get_params)
		if @case.save
			byebug
			#Generating QR code that carries the id of case with special word in front
			@qr = RQRCode::QRCode.new("qrscannertest"+ @case.id.to_s, size: 4)

		else
		end

	end

	def new 
		@case=Case.new
	end

	def edit
	end

	def destroy
	end


private 

	def get_params
		params.require(:case).permit(:serial_number,:case_type)
	end

end
