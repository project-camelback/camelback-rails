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

  def self.get_most_recent_issue(token, user)
    client = Octokit::Client.new(:access_token => token)
    student = Student.find_by(name: user.login)

    student_repos = client.repos

    student_repos.each do |repo|
      if !user_has_forked_repo?(repo, student).empty?
        homework = Homework.where("name = ? AND student_id = ?", repo.name, student.id).first

        if issues_set_and_not_empty?(repo)
          homework.current_issue = get_repo_title(repo)
        elsif issues_are_empty?(repo)
          homework.current_issue = "Currently no issues."
        else
          homework.current_issue = "To use this feature, enable issues in this repo's settings."
        end
        homework.save 
      end
    end
  end

  def self.user_has_forked_repo?(repo, student)
    Homework.where("name = ? AND student_id = ?", repo.name, student.id)
  end

  def self.issues_set_and_not_empty?(repo) 
    repo.rels[:issues].get && !repo.rels[:issues].get.data.empty?
    rescue Exception
    false
  end

  def self.issues_are_empty?(repo)
    repo.rels[:issues].get.data.empty?
    rescue Exception
    false
  end

  def self.get_repo_title(repo)
    repo.rels[:issues].get.data.first.title
    rescue Exception
    false
  end
end
