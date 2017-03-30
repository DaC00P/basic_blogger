# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates the presence of an email" do
    it { should validate_presence_of(:email) }
  end

  describe "validates the presence of an encrypted_password" do
    it { should validate_presence_of(:encrypted_password) }
  end

  describe "validates the presence of a sign_in_count" do
    it { should validate_presence_of(:sign_in_count) }
  end

  describe "has many posts" do
    it {should have_many(:posts)}
  end

  describe "has many comments" do
    it {should have_many(:comments)}
  end
end
