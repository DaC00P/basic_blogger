require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'Posts Controller' do
    context 'when user is not logged in' do
      it 'should redirect to sign in page when the access the index' do
        get :index
        should use_before_action(:authenticate_user!)
        should redirect_to('/users/sign_in')
      end
    end

    context 'when user is logged in' do
        before do
          @user = FactoryGirl.build(:user)
          sign_in(@user)
          should use_before_action(:authenticate_user!)
        end

        it 'should create a post' do
          @post = Post.new(id: 1, title: 'a', content: 'b', user_id: 1)
          expect do
            post :create, post: @post
          end
          assert_response :success
        end
    end
  end
end
