class TasksController < ApplicationController
  def index
    project=Project.find(params[:project_id])
    render json:{
      tasks: project.tasks.order(id: :desc)
    }
  end

  def new
    project=Project.find(params[:project_id])
    render json:{task: project.tasks.new}
  end

  def create
    project=Project.find(params[:project_id])
    if task=project.tasks.create(task_params)
    render json:{task: task}
    else
      render json: {
        message: "Sorry, task could not be created",
        errors: task.errors
      }
    end
  end

  def edit
    project=Project.find(params[:project_id])
    task=project.tasks.find(params[:id])
    render json:{task: task}
  end

  def update
    project=Project.find(params[:project_id])
    if task=project.tasks.find(params[:id])
    render json:{task: task.update(task_params)}
    else
      render json: {
        message:"Sorry, task could not be edited",
        errors: task.errors
      }
    end
  end

  def destroy
    project=Project.find(params[:project_id])
    task=project.tasks.find(params[:id])
    task.destroy
    render json: { destroyed: true }
  end
  private

  def task_params
    params.require(:task).permit(:description, :done, :project_id)
  end
end
