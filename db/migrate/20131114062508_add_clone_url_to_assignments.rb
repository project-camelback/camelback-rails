class AddCloneUrlToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :clone_url, :string
  end
end
