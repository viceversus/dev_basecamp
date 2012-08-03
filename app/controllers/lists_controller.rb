class ListsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    @list = @project.lists.build(params[:list])
    if @list.save
      redirect_to project_path(@project), :notice => "New list created!"
    else
      flash.now[:error] = ":("
      render "projects/show"
    end
  end

  def edit
    @list = List.find(params[:id])
  end
end
