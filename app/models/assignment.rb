# == Schema Information
#
# Table name: assignments
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  full_name           :string(255)
#  web_url             :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  description         :string(255)
#  post_date           :datetime
#  due_date            :datetime
#  evaluation_type     :string(255)
#  branch              :string(255)
#  github_created_at   :string(255)
#  instructor_gravatar :string(255)
#  instructor_profile  :string(255)
#  instructor          :string(255)
#  spec_present        :boolean          default(FALSE)
#

class Assignment < ActiveRecord::Base
  belongs_to :student
  belongs_to :user
  has_many :homeworks
  has_many :students, through: :homeworks

  acts_as_taggable

  # IN RAKE ASSIGNMENTS
  # Assignment.all => clone
  # parse readmes
  # update database and cleanup

  DEFAULT_GENERATE_TAGS_LIST = ["todo", "lab", "homework", "quiz", "rails", "sinatra", "rack", "git"]

  def self.initial_generate_tags
    assignments = Assignment.all
    clone_all(assignments)
    assignments.each { |a| generate_tags(a) }
    sleep 10
    assignments.each { |a| FileUtils.rm_r(a.repo_path) }
  end

  def self.clone_all(assignments)
    assignments.each do |asst|
      asst.clone
    end
    puts "System is cloning. Wait three minutes."
    sleep 180
  end

  def clone
    puts "  Cloning #{self.name}... "
    system(cloner)
  end

  def cloner
    "bash bin/cloner.sh %s %s &> /dev/null &" % [self.name, self.url]
  end

  def url
    clone_url
  end

  def repo_path
    "tmp/#{self.name}"
  end

  def self.generate_tags(assignment)
    tags_array = tags_from_readme(assignment)
    tags_array << DEFAULT_GENERATE_TAGS_LIST.select {|tag| assignment.full_name.include?(tag) && !tags_array.include?(tag) }
    tags_array.flatten!
    assignment.tag_list.add(tags_array)
    assignment.save
  end

  def self.tags_from_readme(assignment)
    tags = []
    file = File.open("#{assignment.repo_path}/README.md")
      file.each_line do |line|
        unless line.match(/^tags: ([\S ]+)/).nil?
          tags = line.match(/^tags: ([\S ]+)/)[1]
        end
      end
    tags.split(", ")
    rescue
      puts "  No readme for #{assignment.name}"
      tags
  end

  def branch
    "master" # see Homework.rb grader_command
  end

end
