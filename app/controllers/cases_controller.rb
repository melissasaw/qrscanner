class CasesController < ApplicationController

	def index
	end

	def create
		# Creating case that links to the user directly
		# Given case type and serial number
		@case=current_user.cases.new(get_params)
		if @case.save

			# if case is save, only assign serial number.
			@case.serial_number = "ORTHO"+ @case.case_type.to_s + "-" +@case.id.to_s
			redirect_to case_path(@case)

	
			#Generating QR code that carries the id of case with special word in front
			# @qr = RQRCode::QRCode.new("qrscannertest"+ @case.id.to_s, size: 4)
			# Wanted to save qr as a string but doent work. 

		else
			flash[:info] = "Whoopss, something went wrong. Case was not created!"
			render template: "/cases/new"
		end

	end

	# Display page for each case
	def show
		@case=Case.find(params[:id])
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
