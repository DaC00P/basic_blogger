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
    end

    context 'when user is logged in' do
      before do
        user = FactoryGirl.build(:user)
        sign_in(user)
        should use_before_action(:authenticate_user!)
      end

      it 'should redirect them to /posts/index' do
        assert_response :success
        redirect_to 'posts'
      end

      it 'should create a post' do
        expect do
          Post.create!(title: 'a', content: 'b', user_id: 3)
        end.to change { Post.all.length }
        assert_response :success
        redirect_to 'posts'
      end
    end
  end
end

# test "logged in should get show" do
#   sign_in users(:one)
#   get :show
#   assert_response :success
# end
#
# test "not authenticated should get redirect" do
# get :show
# assert_response :redirect
# end
