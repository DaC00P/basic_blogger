require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    context 'when user is not logged in' do
      before do
        get :index
        should use_before_action(:authenticate_user!)
      end

      it 'should redirect to sign in page when the access the index' do
        should redirect_to('/users/sign_in')
      end

      it 'should NOT create a post' do
        @post = FactoryGirl.build(:post)
        expect do
          post :create, post: { content: @post.content, title: @post.title }
        end.to_not change { Post.all.length }
        assert_response 302
        should redirect_to('/users/sign_in')
      end
    end

    context 'when user is logged in' do
        before do
          @user = FactoryGirl.build(:user)
          sign_in(@user)
          should use_before_action(:authenticate_user!)
        end
    end
  end
end
