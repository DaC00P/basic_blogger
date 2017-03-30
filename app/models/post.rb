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

  #TODO Consider adding validation for post titles being unique? Re-Post factor

  has_many :comments, :dependent => :destroy

  belongs_to :user
end
