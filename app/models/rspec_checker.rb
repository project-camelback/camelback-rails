class RSpecChecker < ActiveRecord::Base

  attr_accessor :failure_condition
  attr_reader :clone_url, :user_name, :rspec_output, :branch, :failure_hash

  def initialize(assignment_submission)
    @clone_url = assignment_submission.url
    @user_name = assignment_submission.student.github_username
    @branch = assignment_submission.assignment.branch
  end

  def run
    self.clone_repo
    self.execute_rspec
    self.parse_rspec_output
  end

  def failure_condition?
    self.failure_condition
  end

  def remove_user_directory
    FileUtils.remove_dir("tmp/#{self.user_name}") if File.exists?("tmp/#{self.user_name}")
  end

  def clone_repo
    remove_user_directory
    FileUtils.mkdir_p("tmp")
    g = Git.clone(self.clone_url, "tmp/#{self.user_name}", :path => './')
    begin
      g.checkout(self.branch)
    rescue
      self.failure_condition = true
      @failure_hash = { :failure_descriptions => "Couldn't find '#{self.branch}' branch. Please resubmit."}
    end
  end

  def execute_rspec
    FileUtils.cd("tmp/#{self.user_name}")
    `bundle install` if File.exist?("Gemfile")
    raw_rspec_json = `rspec --format json`
    @rspec_output = Oj.load(raw_rspec_json, symbol_keys: true)
    # Bundler.with_clean_env do
    #   FileUtils.cd("tmp/#{self.user_name}")
    #   if File.exist?("Gemfile")
    #     puts "#{self.user_name}: before bundle install"
    #     # Bundler.with_clean_env do
    #       system('bundle install #> /dev/null')
    #     # end
    #     puts "#{self.user_name}: after bundle install"
    #   end
    #   puts "#{self.user_name}: before running RSpec"
    #   begin
      
    #       # system('bundle install #> /dev/null')
    #       # sleep 5
    #       RSpec::Core::Runner.run(["./"])

    #     puts "#{self.user_name}: after running RSpec"
    #     @rspec_output = json_formatter.output_hash
    #   rescue Exception => e
    #     self.failure_condition = true
    #     @failure_hash = { :failure_descriptions => "Unable to run RSpec: #{e.message}" }
    #     puts "#{self.user_name}: RSpec failed."
    #   ensure
    #     FileUtils.cd("../..")
    #     remove_user_directory
    #   end
    # end
  end
  
  def parse_rspec_output
    if failure_condition?
      self.failure_hash
    else
      {
       :examples => @rspec_output[:summary][:example_count],
       :passes => @rspec_output[:summary][:example_count] - @rspec_output[:summary][:failure_count] - @rspec_output[:summary][:pending_count],
       :pendings => @rspec_output[:summary][:pending_count],
       :failures => @rspec_output[:summary][:failure_count],
       :failure_descriptions => @rspec_output[:examples].select do |example|
          example[:status] == 'failed'
        end.map {|ex| ex[:full_description]}.join(";")
      }
    end 
  end

  def check_coverage
  end

end