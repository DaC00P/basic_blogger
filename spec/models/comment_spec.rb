# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validates the presence of a content" do
    it { should validate_presence_of(:content) }
  end

  describe "validates the presence of a post_id" do
    it { should validate_presence_of(:post_id) }
  end

  describe "validates the presence of a user_id" do
    it { should validate_presence_of(:user_id) }
  end

  describe "should belong to a post" do
    it {should belong_to(:post)}
  end

  describe "should belong to a user" do
    it {should belong_to(:user)}
  end
end
