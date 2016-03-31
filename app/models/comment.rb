# == Schema Information
# Schema version: 20160211154639
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
end
