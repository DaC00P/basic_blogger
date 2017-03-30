# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validates the presence of a title" do
    it { should validate_presence_of(:title) }
  end

  describe "validates the presence of a content" do
    it { should validate_presence_of(:content) }
  end

  describe "validates the presence of a user_id" do
    it { should validate_presence_of(:user_id) }
  end

  describe "has many comments" do
    it {should have_many(:comments)}
  end

  describe "should belong to a user" do
    it {should belong_to(:user)}
  end

  it "destroys dependent comments" do
    post = FactoryGirl.build(:post)

    2.times do
      post.comments << FactoryGirl.build(:comment)
    end

    expect { post.destroy }.to change { post.comments.length }
  end


end
