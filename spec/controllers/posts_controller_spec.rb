require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'Posts Controller' do
    describe 'when user is not logged in' do
      it 'should redirect to sign in page when the access the index' do
        get :index
        should use_before_action(:authenticate_user!)
        should redirect_to('/users/sign_in')
      end
    end

    describe 'post creation' do
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
