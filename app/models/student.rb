# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  last_login      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  github_username :string(255)
#  semester        :string(255)
#  student_id      :integer
#  assignment_id   :integer
#  full_name       :string(255)
#  web_url         :string(255)
#  clone_url       :string(255)
#

class Student < ActiveRecord::Base
  has_many :homeworks
  has_many :assignments, through: :homeworks
  has_many :assignment_submissions

end
