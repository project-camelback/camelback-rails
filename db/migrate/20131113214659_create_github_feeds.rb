class CreateGithubFeeds < ActiveRecord::Migration
  def change
    create_table :github_feeds do |t|

      t.timestamps
    end
  end
end
