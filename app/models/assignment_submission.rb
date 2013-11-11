class AssignmentSubmission < ActiveRecord::Base

  belongs_to :assignment
  belongs_to :student

  # grader.sh <$1 github_username> <$2 github_repository> <$3 branch>

  def github_username
    self.student.github_username
  end

  def grader_command
    "bash bin/grader.sh %s %s %s %s &> /dev/null &" % [github_username, self.url, self.assignment.branch, self.id]
  end

  def results_file
    "tmp/#{self.github_username}/.rspec-results.json"
  end

  def errors_file
    "tmp/#{self.github_username}/.rspec-results.errors"
  end

  def process_evaluation
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
    
    FileUtils.rm_r("tmp/#{github_username}")
  end

  def evaluate
    self.update(:evaluated => false)
    system(grader_command)
  end

  def self.evaluate_all(assignment)
    assignment.assignment_submissions.each do |sub|
      sub.evaluate
    end
  end

  def self.percent_evaluated(assignment)
    total_count = assignment.assignment_submissions.count
    evaluated_count = self.where(:assignment => assignment, :evaluated => true).count
    evaluated_count*100/total_count
  end

end