class ProjectsController < ApplicationController
  def index
    render json:{
      projects: Project.order(id: :desc)
    }
  end

  def new
    render json:{project: Project.new}
  end


  def create
    if project=Project.create(project_params)
    render json:{project: project}
    else
      render json: {
        message: "Sorry, project could not be created",
        errors: project.errors
      }
    end
  end

  def edit
    render json:{project: Project.find(params[:id])}
  end

  def update
    if project=Project.find(params[:id])
    render json:{project: project.update(project_params)}
    else
      render json: {
        message:"Sorry, project could not be edited",
        errors: project.errors
      }
    end
  end

  def destroy
    project=Project.find(params[:id])
    project.destroy
    render json: { destroyed: true }
  end

  def show
    project=Project.find(params[:id])
    tasks=project.tasks.order(id: :desc)
    render json:{project: tasks}
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
