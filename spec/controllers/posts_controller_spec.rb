require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    context 'when user is logged in' do
      user = FactoryGirl.build(:user)

      before do
        sign_in user
        get :index
      end

      
    end
    context 'when user is logged out' do
      pending
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
