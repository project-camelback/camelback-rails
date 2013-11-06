class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :student_id
      t.integer :assignment_id
      t.string :name
      t.string :full_name
      t.string :web_url
      t.string :clone_url

      t.timestamps
    end
  end
end
