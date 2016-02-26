class TasksController < ApplicationController
  before_action :set_project
  def index
    render json:{
      tasks: @project.tasks.order(id: :desc)
    }
  end

  def new
    render json:{task: @project.tasks.new}
  end

  def create
    task=Task.new(task_params)
    task.project=@project

    if task.save
    render json:{task: task}
    else
      render json: {
        message: "Sorry, task could not be created",
        errors: task.errors
      }
    end
  end

  def edit
    task=@project.tasks.find(params[:id])
    render json:{task: task}
  end

  def update
    if task=@project.tasks.find(params[:id])
    render json:{task: task.update(task_params)}
    else
      render json: {
        message:"Sorry, task could not be edited",
        errors: task.errors
      }
    end
  end

  def destroy
    task=@project.tasks.find(params[:id])
    task.destroy
    render json: { destroyed: true }
  end
  private

  def set_project
    @project=Project.find(params[:project_id])
  end
  def task_params
    params.require(:task).permit(:description, :done, :project_id)
  end
end
