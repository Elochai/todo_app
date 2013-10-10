class ProjectsController < ApplicationController
	  before_filter :authenticate_user!

  def index
  	@user_projects = current_user.projects
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to :action => 'index'
  end

  def new
  	@project= Project.new
  end

  def create
  	@project = current_user.projects.create(params[:project])
    if !@project.valid?
      flash[:error] = "Project name can't be blank"
      redirect_to new_project_path
    else
      flash[:notice] = "Project created"
      redirect_to :action => 'index'
    end
  end

  def show
 	 @project = Project.find(params[:id])	
  	 @task = @project.tasks.new
  end

  def edit
  	@project = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])
  	if @project.update_attributes(params[:project])
  	  flash[:notice] = "Project updated"
  	  redirect_to project_path(@project)
    else
      flash[:error] = "Could not update project"
      redirect_to edit_project_path(@project)
    end
  end

end
