# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  content    :text
#  text       :text
#  created_at :datetime
#  updated_at :datetime
#

class Plan < ActiveRecord::Base
end
