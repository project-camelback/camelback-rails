class GetAssignments
  attr_reader :client

  def initialize
    authenticate
  end

  def call
    insert_assignments
  end

  def authenticate
    @client = Octokit::Client.new \
      :access_token => GITHUB_PERSONAL_ACCESS_TOKEN

    if authenticated?
      puts "Authenticated as #{@client.user.login}!"
    else
      raise GithubAuthError
    end
  end

  def authenticated?
    @client.user_authenticated?
  end

  def assignments
    @client.org_repos('flatiron-school', :type => 'private')
  end

  def insert_assignments
    assignments.each do |assignment|
      Assignment.create(:title => assignment.name, :url => repo_url(assignment.full_name))
      puts "Saving #{assignment.name}."
    end
  end

  def repo_url(full_name)
    "https://github.com/#{full_name}"
  end
end

class GithubAuthError < Exception
end
