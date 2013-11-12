# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  last_login      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  github_username :string(255)
#  semester        :string(255)
#

class AddFieldsToHomeworks < ActiveRecord::Migration
  def change
    add_column :students, :student_id, :integer
    add_column :students, :assignment_id, :integer
    add_column :students, :full_name, :string
    add_column :students, :url, :string
    add_column :students, :clone_url, :string
  end
end


       # create_table :homeworks do |t|
    #   t.integer :student_id
    #   t.integer :assignment_id
    #   t.string :name
    #   t.string :full_name
    #   t.string :web_url
    #   t.string :clone_url

    #   t.timestamps
    # end
