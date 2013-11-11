class GithubForks < ActiveRecord::Base

  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def api_url
    "https://api.github.com/repos/#{self.repo.match(/github\.com.(.+)\.git/)[1]}/forks"
  end

  def get_forks
    json = Oj.load(open(api_url, "Authorization" => "token 11b80d7ffad66524d6a75476084a0dc706f0fd7a"))
    clones = json.map do |clone|
      { :github_username => clone["owner"]["login"],
        :url => clone["ssh_url"], # alt: clone["clone_url"]
        :avatar_url => clone["owner"]["avatar_url"]
      }
    end
  end
end