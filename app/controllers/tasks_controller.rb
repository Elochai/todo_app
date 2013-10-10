class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  attr_accessor :completed, :deadline


  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project), :notice => "Successfully deleted'"
  end

  def create
    @task = @project.tasks.create(params[:task])
    unless @task
      flash[:error] = @task.errors.first
      redirect_to project_path(@project)
    else
      flash[:notice] = "Task created"
      redirect_to project_path(@project)
    end
  end

  def complete
    @task = @project.tasks.find(params[:id])
   if @task.completed == false
     @task.update_attribute(:completed, true)
      redirect_to project_path(@project)
   else
    @task.update_attribute(:completed, false)
    redirect_to project_path(@project)
   end
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Task updated"
      redirect_to project_path(@project)
    else
      flash[:error] = "Could not update task"
      redirect_to edit_project_task_path(@project, @task)
    end
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def set_deadline
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def create_deadline
    @task = @project.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Deadline set"
      redirect_to project_path(@project)
    else
      flash[:error] = "Could not set deadline"
      redirect_to set_deadline_project_task_path(@project, @task)
    end
  end

end
