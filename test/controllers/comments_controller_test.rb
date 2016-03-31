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

require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
