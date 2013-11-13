class AddInstructorsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :instructor, :string
  end
end
