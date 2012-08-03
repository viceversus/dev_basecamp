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
      @user = create(:user)
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

  describe "#edit" do
    it "assigns the correct project" do
      @project = create(:project)
      get(:edit, :id => @project.id)
      assigns(:project).should eq @project
    end
  end

  describe "#update" do
    context "given valid parameters" do
      it "updates the project" do
        @project = create(:project)
        put(:update, :id => @project.id, :project => { :title => 'blah', :description => 'something' })
        assigns(:project).title.should eq 'blah'
        assigns(:project).description.should eq 'something'
      end
    end

    context "given invalid parameters" do
      before :each do
        Project.any_instance.stub(:update_attributes).and_return(false)
        @project = create(:project)
        put(:update, :id => @project.id)
      end

      it "adds a flash message" do
        flash[:error].should eq ":("
      end

      it "renders edit" do
        response.should render_template(:edit)
      end
    end

    describe "#show" do
    end
  end
end