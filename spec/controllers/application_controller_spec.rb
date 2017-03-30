require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe "should require login as a before_action" do
    it {should use_before_action(:authenticate_user!)}
  end

  describe "should protect_from_forgery with :exception" do
    it {allow(ApplicationController).to receive(:protect_from_forgery).and_return(true)}
  end
end
