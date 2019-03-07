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
			
			crowns= ["Get 3d scan", "make mould","cast","milling","oven dry"]
			retainers =["Get 3d scan", "make mould","cast","milling","oven dry"]
			braces = ["Get 3d scan", "make mould","cast","milling","oven dry"]
			babies =["Get 3d scan", "make mould","cast","milling","oven dry"]

			# Automatically create respective tasks for 
			case @case.case_type

			when 1
				crowns.each do |c|
					@task=@case.tasks.new(description:c)
					@task.save
				end
			when 2
				retainers.each do |r|
					@task=@case.tasks.new(description:r)
					@task.save
				end
			when 3
				braces.each do |b|
					@task=@case.tasks.new(description:b)
					@task.save
				end
			when 4
				babies.each do |bb|
					@task=@case.tasks.new(description:bb)
					@task.save
				end
		end

			redirect_to case_path(@case)

		else
			flash[:info] = "Whoopss, something went wrong. Case was not created!"
			render template: "/cases/new"
		end

	end

	# Display page for each case
	def show
		@case=Case.find(params[:id])
		@tasks = @case.tasks
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
