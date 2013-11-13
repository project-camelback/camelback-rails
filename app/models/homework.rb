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

  def get_most_recent_issue
    client = Octokit::Client.new :access_token => session[:token]
    student = Student.find_by(name: current_user.login)

    student_repos = client.repos
    student_homeworks = Homework.where("student_id = ?", student.id)

    student_repos.each do |repo|
      if !user_has_forked_repo?(repo, student).empty?
        homework = Homework.where("name = ? AND student_id = ?", repo.name, student.id)

        if issues_set_and_not_empty?(repo)
          homework.current_issue = get_repo_title(repo)
        elsif issues_are_empty?(repo)
          homework.current_issue = "Currently no issues".
        rescue Octokit::ClientError => e
          homework.current_issue = message_to_enable_issues
        end
      end
    end
  end

  def user_has_forked_repo?(repo, student)
    Homework.where("name = ? AND student_id = ?", repo.name, student.id)
  end

  def issues_set_and_not_empty?(repo) 
    repo.rels[:issues].get && !repo.rels[:issues].get.data.empty?
  end

  def issues_are_empty?(repo)
    repo.rels[:issues].get.data.empty?
  end

  def get_repo_title(repo)
    repo.rels[:issues].get.data.first.title
  end

  def message_to_enable_issues
    "To use this feature, enable issues in this repo's settings."
  end
end













