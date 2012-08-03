require 'spec_helper'

describe UsersController do
  describe "#show" do
    before :each do
      @user = create(:user)
    end

    context 'with guest' do
      it "redirects to sign in page" do
        get(:show, :username => @user.username)
        request.should redirect_to(new_user_session_path)
      end
    end

    context 'with signed in user' do
      before :each do
        sign_in @user
      end

      it "shows current_user if the username does not exist" do
        get(:show, :username => "")
        assigns(:user).should eq @user
      end

      it "shows correct user when username does exist" do
        user2 = create(:user)
        get(:show, :username => user2.username)
        assigns(:user).should eq user2
      end
    end
  end
end
