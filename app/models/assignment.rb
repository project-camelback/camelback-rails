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
  belongs_to :student
  belongs_to :user
  has_many :homeworks
  has_many :students, through: :homeworks

  acts_as_taggable

  DEFAULT_GENERATE_TAGS_LIST = ["todo", "lab", "homework", "hw", "quiz", "rails", "sinatra", "rack", "git"]

  def generate_tags(tags_array)
    # when assignments are queried, we should run #generate_tags

    # tags come from the readme and the full_name (example: playlister-todo)
    
      # generate tags should include all readme tags, which is tags_array
      # readme line looks like:
      # tags: sinatra, forms, hashes, object orientation, mvc, rest, erb
    
      # create REGEX to look for any tags in the repo full_name

    

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
