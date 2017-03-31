require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    context 'when user is not logged in' do
      it 'should redirect to sign in page' do
        get :index
        should use_before_action(:authenticate_user!)
        should redirect_to('/users/sign_in')
      end
    end

    context 'when user is logged in' do
      it 'should redirect them to /posts/index' do
        user = FactoryGirl.build(:user)
        sign_in(user)
        should use_before_action(:authenticate_user!)
        assert_response :success
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
