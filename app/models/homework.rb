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
