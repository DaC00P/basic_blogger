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

class Post < ActiveRecord::Base
  validates :title,
            :content,
            presence: true

  #TODO add validation for post titles being unique

  has_many :comments

  belongs_to :user
end
