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

class Comment < ActiveRecord::Base
  validates :content,
            :post_id,
            :user_id,
            presence: true

  #TODO Prevent obscene comments from 'bad actors' aka trolls.

  belongs_to :post

  belongs_to :user
end
