class TasksController < ApplicationController
  def index
    render json:{
      tasks: Task.all
    }
  end
end
