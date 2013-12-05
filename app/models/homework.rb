# == Schema Information
#
# Table name: homeworks
#
#  id                   :integer          not null, primary key
#  student_id           :integer
#  assignment_id        :integer
#  name                 :string(255)
#  full_name            :string(255)
#  web_url              :string(255)
#  clone_url            :string(255)
#  gravatar_url         :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  evaluated            :boolean
#  examples             :integer
#  passes               :integer
#  pendings             :integer
#  failures             :integer
#  failure_descriptions :string(255)
#  evaluation_date      :string(255)
#

class Homework < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment

  def self.get_specs(student)
    @homeworks = Homework.where(:student_id => student.id)
    @tests = []

    @homeworks.each_with_index do |homework,i|
      @tests[i] = {}
      if homework.assignment.spec_present?
        @tests[i][:passing] = homework.passes ||= 0
        @tests[i][:pending] = homework.pendings  ||= 0
        @tests[i][:failing] = homework.failures ||= 0

        test_total = @tests[i][:passing].to_int + @tests[i][:pending].to_int + @tests[i][:failing].to_int

        if test_total != 0
          @tests[i][:passing_percentage] =  @tests[i][:passing]/test_total
          @tests[i][:pending_percentage] =  @tests[i][:pending]/test_total
          @tests[i][:failing_percentage] =  @tests[i][:failing]/test_total
        end
      else
        @tests[i][:no_test]
      end
    end
      return @tests
  end

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
          homework.current_issue = "Enable repo issue to access this feature."
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

  def percentage(n, d)
    (n / d * 100).to_s + "%"
  end

  def rspec_score
    {:passing => percentage(self.passes, self.examples),
    :pending => percentage(self.pendings, self.examples),
    :failing => percentage(self.failures, self.examples)}
  end
  
  def github_username
    student.name
  end

  def assignment_name
    assignment.name
  end

  def url
    clone_url
  end

  def grader_command
    "bash bin/grader.sh %s %s %s %s &> /dev/null &" % [github_username, self.url, self.assignment.branch, self.id]
  end

  def grader_path
    "tmp/#{self.github_username}"
  end

  def results_file
    grader_path + "/.rspec-results.json"
  end

  def errors_file
    grader_path + "/.rspec-results.errors"
  end

  def process_evaluation
    puts "  saving"
    assignment_submissions_hash = if File.exists?(results_file) && !(results = File.read(results_file)).empty?
      results_json = Oj.load(results, symbol_keys: true)
      {
        :examples => results_json[:summary][:example_count],
        :passes => results_json[:summary][:example_count] - results_json[:summary][:failure_count] - results_json[:summary][:pending_count],
        :pendings => results_json[:summary][:pending_count],
        :failures => results_json[:summary][:failure_count],
        :failure_descriptions => results_json[:examples].select do |example|
          example[:status] == 'failed'
        end.map {|ex| ex[:full_description]}.join(";")
      }
    elsif File.exists?(errors_file)
      {:failure_descriptions => File.read(errors_file)}
    else
      {:failure_descriptions => "Unknown fatal error."}
    end

    assignment_submissions_hash.merge!({ :evaluated => true, :evaluation_date => Time.now })
    
    self.update(assignment_submissions_hash)
    
    FileUtils.rm_r(grader_path)
  end

  def evaluate
    puts "  #{self.github_username}... "
    self.update(:evaluated => false)
    system(grader_command)
  end

  def self.evaluate_student(student_obj)
    student_obj.homeworks.where(spec_present: :true).each do |sub|
      sub.evaluate
    end
  end

  def self.evaluate_all(assignment)
    assignment.homeworks.each do |sub|
      sub.evaluate
    end
  end

  def self.percent_evaluated(assignment)
    total_count = assignment.homeworks.count
    evaluated_count = self.where(:assignment => assignment, :evaluated => true).count
    evaluated_count*100/total_count
  end
end
