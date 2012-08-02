require 'spec_helper'

describe ProjectsController do
  render_views

  describe "#new" do
    it "assigns a new instance of Project" do
      get(:new)
      assigns(:project).should be_new_record
    end
  end

  describe "#create" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it "assigns the current user" do
      post(:create)
      assigns(:user).should == @user
    end

    context "given valid parameters" do
      it "saves the project" do
        post(:create, :project => { :title => 'blah', :description => 'something'} )
        assigns(:project).should_not be_new_record
      end
    end

    context "given invalid parameters" do
      before :each do
        Project.any_instance.stub(:save).and_return(false)
        post(:create)
      end

      it "adds a flash message" do
        flash[:error].should == ":("
      end

      it "renders new" do
        response.should render_template(:new)
      end
    end
  end

end

# def create
#   @user = current_user
#   @project = @user.projects_as_owner.build(params[:project])
#   if @project.save
#     redirect_to @project, notice: "Hooray!"
#   else
#     flash.now[:error] = ":("
#     render :new
#   end
# end