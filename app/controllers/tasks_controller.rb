class TasksController < ApplicationController
  def index
    render json:{
      tasks: Task.order(id: :desc)
    }
  end

  def new
    render json:{task: Task.new}
  end

  def create
    if task=Task.create(task_params)
    render json:{task: task}
    else
      render json: {
        message: "Sorry, task could not be created",
        errors: task.errors
      }
    end
  end

  def edit
    render json:{task: Task.find(params[:id])}
  end

  def update
    if task=Task.find(params[:id])
    render json:{task: task.update(task_params)}
    else
      render json: {
        message:"Sorry, task could not be edited",
        errors: task.errors
      }
    end
  end

  def destroy
    task=Task.find(params[:id])
    task.destroy
    render json: { destroyed: true }
  end
  private

  def task_params
    params.require(:task).permit(:description, :done)
  end
end
