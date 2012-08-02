class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @user = current_user
    @project = @user.projects_as_owner.build(params[:project])
    if @project.save
      redirect_to @project, notice: "Hooray!"
    else
      flash.now[:error] = ":("
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "Hooray!"
    else
      flash.now[:error] = ":("
      render :edit
    end
  end

end
