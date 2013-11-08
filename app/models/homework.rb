# == Schema Information
#
# Table name: homeworks
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  assignment_id :integer
#  name          :string(255)
#  full_name     :string(255)
#  web_url       :string(255)
#  clone_url     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Homework < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment
end
