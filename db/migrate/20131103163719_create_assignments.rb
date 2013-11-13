class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :full_name
      t.string :web_url

      t.timestamps
    end
  end
end
