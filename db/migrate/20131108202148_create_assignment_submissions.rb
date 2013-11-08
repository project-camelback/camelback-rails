class CreateAssignmentSubmissions < ActiveRecord::Migration
  def change
    create_table :assignment_submissions do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.datetime :evaluation_date
      t.boolean :evaluated, :default => false
      t.integer :passes, :default => 0
      t.integer :pendings, :default => 0
      t.integer :failures, :default => 0
      t.integer :examples, :default => 0
      t.string :failure_descriptions, :size => 5000
      t.string :teacher_comments, :size => 5000
      t.string :url
    end
  end
end
