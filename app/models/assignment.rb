# == Schema Information
#
# Table name: assignments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Assignment < ActiveRecord::Base
  has_many :homeworks
  has_many :students, through: :homeworks

  acts_as_taggable

  DEFAULT_GENERATE_TAGS_LIST = ["todo", "lab", "homework", "hw", "quiz", "rails", "sinatra", "rack", "git"]

  def generate_tags
    # when assignments are queried, we should run #generate_tags, then add all tags into the tag_list

    # tags come from the readme and the full_name (example: playlister-todo)
    
      # generate tags should include all readme tags
      # readme line looks like:
      # tags: sinatra, forms, hashes, object orientation, mvc, rest, erb
    
      # create REGEX to look for any tags in the repo full_name



  end

  def make_scrape_url
    self.url + "/blob/master/README.md"
  end
end
