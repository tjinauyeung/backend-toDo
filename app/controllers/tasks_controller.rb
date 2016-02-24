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
    render json:{task: Task.create(task_params)}
  end

  def edit
    render json:{task: Task.find(params[:id])}
  end

  def update
    task=Task.find(params[:id])
    render json:{task: task.update(task_params)}

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
