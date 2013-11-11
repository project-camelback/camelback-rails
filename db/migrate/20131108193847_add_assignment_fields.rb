class AddAssignmentFields < ActiveRecord::Migration
  def change
    #add_column :assignments, :title, :string
    add_column :assignments, :description, :string,:size => 5000
    add_column :assignments, :post_date, :datetime
    add_column :assignments, :due_date, :datetime
    add_column :assignments, :evaluation_type, :string
    add_column :assignments, :branch, :string
    #add_column :assignments, :url, :string
  end
end