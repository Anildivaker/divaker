class ProjectController < ApplicationController

	def show
		@project =Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params_project)
		if @project.save
			redirect_to @project
		else
			render new, status: :unprocessable_entity
		end		
	end

end
