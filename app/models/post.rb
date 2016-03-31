# == Schema Information
# Schema version: 20160211161853
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

class Post < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	belongs_to :author
end
