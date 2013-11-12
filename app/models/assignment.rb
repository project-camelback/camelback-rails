# == Schema Information
#
# Table name: assignments
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  full_name       :string(255)
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
  belongs_to :student
  belongs_to :user
  has_many :homeworks
  has_many :students, through: :homeworks

  acts_as_taggable

  DEFAULT_GENERATE_TAGS_LIST = ["todo", "lab", "homework", "quiz", "rails", "sinatra", "rack", "git"]

  def self.generate_tags(assignment, client)
    # tags_array = self.scrape_for_tags(assignment, client)
    # tags_array << DEFAULT_GENERATE_TAGS_LIST.select {|tag| assignment.full_name.include?(tag) && !tags_array.include?(tag) }
    tags_array = DEFAULT_GENERATE_TAGS_LIST.select {|tag| assignment.full_name.include?(tag) }
    # tags_array.flatten!
  end

  def self.scrape_for_tags(assignment, client)
    scrape_url = assignment.make_scrape_url
    scrape_url.nil? ? [] : self.scrape_and_create_tags(scrape_url, client)
  end

  def self.scrape_and_create_tags(scrape_url, client)
    # returns an array of tags and languages set by the instructor. Separating the two will require further logic.
    # binding.pry
    readme_page = Nokogiri::HTML(open(scrape_url))
    readme_page.css("th:contains('tags')").first.parent.parent.parent.css("tbody div").collect do |div_tag| div_tag.text end.join(", ").split(", ") 
  end

  def make_scrape_url
    self.url + "/blob/master/README.md"
  end

  #one_to_many :assignment_submissions

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
