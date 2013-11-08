# == Schema Information
#
# Table name: assignments
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  url             :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  description     :string(255)
#  post_date       :datetime
#  due_date        :datetime
#  evaluation_type :string(255)
#  branch          :string(255)
#

class Assignment < ActiveRecord::Base
  has_many :homeworks
  has_many :students, through: :homeworks
  one_to_many :assignment_submissions

  def pull_submissions
    github_fork = GithubForks.new(self.url)
    github_fork.get_forks.each do |fork|
      student = Student.find_or_create(:github_username => fork[:github_username])
      student.update(:avatar_url => fork[:avatar_url])
      unless AssignmentSubmission.find(:student => student, :assignment => self)
        self.add_assignment_submission(:url => fork[:url], :student => student)
      end
    end
  end
  
end
