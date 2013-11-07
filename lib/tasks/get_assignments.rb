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

  def create_tags(assignment)
    scrape_url = assignment.make_scrape_url
    scrape(scrape_url) if scrape_url
    
  end

  def scrape(scrape_url)
    readme_page = Nokogiri::HTML(open(scrape_url))
  end

  def insert_assignments
    assignments.each do |assignment|
      a = Assignment.create(
        :name => assignment.name,
        :full_name => assignment.full_name,
        :url => repo_url(assignment.full_name))
      puts "Saving #{assignment.name}."
      insert_forks(a)
      
      tags_to_generate = create_tags(a)

      # a.tag_list.add(generate_tags())
      a.save
    end
  end

  def repo_url(full_name)
    "https://github.com/#{full_name}"
  end

  def insert_forks(assignment)
    forks_array = client.forks(assignment.full_name)
    forks_array.each do |fork|
      s = Student.find_or_create_by(:name => fork.owner.login)
      h = Homework.create({
        :full_name => fork.full_name,
        :student_id => s.id,
        :assignment_id => assignment.id
      })
      puts "  Saving #{h.full_name}."
    end
  end
end

class GithubAuthError < Exception
end
