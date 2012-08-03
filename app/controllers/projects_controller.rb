class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project, :only => [:show, :edit, :update]

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
    @list = List.new
    @list.tasks.build
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "Hooray!"
    else
      flash.now[:error] = ":("
      render :edit
    end
  end

private
  def find_project
    @project = Project.find(params[:id])
  end
end
